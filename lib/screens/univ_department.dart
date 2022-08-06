import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/dep_model.dart';
import 'package:university_app/screens/department_screen.dart';
import 'package:university_app/widgets/univ_department.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UnivDepartment extends StatefulWidget {
  const UnivDepartment({ Key? key , required this.id }) : super(key: key);
  final int id ;

  @override
  State<UnivDepartment> createState() => _UnivDepartmenetState();
}

class _UnivDepartmenetState extends State<UnivDepartment> {

   late Future<List<DepartmentModel>> _future;
  List<DepartmentModel> _department = <DepartmentModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = HomeApiController().getDepatement(widget.id.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('أقسام الجامعات',style: TextStyle(fontFamily: 'Droid'),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),Color(0xff3AA8F2)
            ])          
         ),        
     ),      
 ),

 body:Padding(
   padding:  EdgeInsets.only(top: 30.h , left:10.w ),
   child: FutureBuilder<List<DepartmentModel>>(
     future: _future,
     builder:(context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else if (snapshot.hasData && snapshot.data!.isNotEmpty){
      _department = snapshot.data ??[];
      return  GridView.builder(
                  itemCount: _department.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      
   
                  ),
                  itemBuilder: (BuildContext context, int index){
                    return  InkWell(
                      onTap: (){
                        print('clicked');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DepartmentScreen(id: _department[index].id)));
                      },
                      child: UnivDepartmentWidget(title: _department[index].name ,
                     //  imagePath: _department[index].photo,
                       ));
                  },
                );
      }
      else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Image.asset('images/nodata.jpg', height: 250.h, width: 250.w,),
                      Center(
                        child: Text(
                          'سيتم إضافتها قريباً ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      )
                    ],
                  );
      }
     }
   ),
 ),
    );
  }
}