import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/major_dep.dart';
import 'package:university_app/screens/major_screen.dart';
import 'package:university_app/widgets/department.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({ Key? key , required this.id }) : super(key: key);
   final int id;
  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
   late Future<List<MajorModel>> _future;
  List<MajorModel> _major = <MajorModel>[];

  @override
  void initState() {
    
    super.initState();
    _future = HomeApiController().getMajor(widget.id.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('القسم ', style: TextStyle(fontFamily: 'Droid'),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),Color(0xff3AA8F2),
            ])          
         ),        
     ),      
 ),

 body: FutureBuilder<List<MajorModel>>(
   future: _future,
   builder: (context, snapshot) {
     if(snapshot.connectionState == ConnectionState.waiting){
       return Center(child: CircularProgressIndicator());
     }
     else if (snapshot.hasData && snapshot.data!.isNotEmpty){
    _major = snapshot.data ??[];

    return ListView.builder(
       itemCount: _major.length,
       itemBuilder: (context, index) {
       return Column(
         children: [
 
           SizedBox(height: 20.h,),
  InkWell(
    onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => MajorScreen(id: _major[index].id)));
    },
    child: Department(title: _major[index].name))
         ],
       );
     },);
     }

     else {
        return Center(
              child: Column(
                children: const [
                  Icon(Icons.warning, size: 80),
                  Text(
                    'NO DATA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            );
     }
   }
 ),
    );
  }
}