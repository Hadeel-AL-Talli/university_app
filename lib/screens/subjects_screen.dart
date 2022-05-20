import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/courses.dart';
import 'package:university_app/screens/subject_screen.dart';

import '../widgets/subjects.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SubjectsScreens extends StatefulWidget {
  const SubjectsScreens({ Key? key , required this.mid , required this.sid , required this.yid }) : super(key: key);
  final int mid ; 
  final int yid;
  final int sid ;
  @override
  State<SubjectsScreens> createState() => _SubjectsScreensState();
}

class _SubjectsScreensState extends State<SubjectsScreens> {
   late Future<List<CoursesModel>> _future;
  List<CoursesModel> _subjects = <CoursesModel>[];

  @override
  void initState() {
    
    super.initState();
    _future = HomeApiController().geSemesterCourses(widget.mid.toString(), widget.yid.toString(), widget.sid.toString());
    print(_future);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('المواد  ',style: TextStyle(fontFamily: 'Droid'),),
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

      body: FutureBuilder<List<CoursesModel>>(
        future: _future,
        builder: (context, snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasData && snapshot.data!.isNotEmpty){
       _subjects = snapshot.data ??[];
       print('subjects');
          return GridView.builder(  
             padding:  EdgeInsets.only(left:5.w, right: 5.w, top: 20.h, bottom: 20.h),
                  itemCount: _subjects.length,  
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                      crossAxisCount: 2,  
                    
                  ),  
                  itemBuilder: (BuildContext context, int index){  
                    return  InkWell(
                  onTap:()=>  Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectScreen(id: _subjects[index].id, name:  _subjects[index].name,))),

                      child: SubjectsWidget(title:   _subjects[index].name, imagepath: 'images/folder.png',));
                  },  
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