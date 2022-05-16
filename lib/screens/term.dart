import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/semester.dart';
import 'package:university_app/widgets/term.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermScreen extends StatefulWidget {
  const TermScreen({ Key? key }) : super(key: key);

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  late Future<List<SemesterModel>> _future;
  List<SemesterModel> _semester = <SemesterModel>[];

  @override
  void initState() {
    
    super.initState();
    _future = HomeApiController().getSemesters();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('التخصص ',style: TextStyle(fontFamily: 'Droid'),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),
              Color(0xff3AA8F2),
            ])          
         ),        
     ),      
 ),

 body: FutureBuilder<List<SemesterModel>>(
   future:  _future,
   builder: (context, snapshot) {
       if(snapshot.connectionState == ConnectionState.waiting){
           return Center(child: CircularProgressIndicator(),);
         }
         else if (snapshot.hasData && snapshot.data!.isNotEmpty){
           print('terms');
            _semester = snapshot.data ?? [];
            
     return ListView.builder(
       itemCount: _semester.length,
       itemBuilder: (context ,index){
         return  Column(
          
           children: [
             SizedBox(height: 50.h,),
             TermWidget(name: _semester[index].name),

             
            
           ],
         );
      
       }
      ); 
         }

         else{
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