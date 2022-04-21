import 'package:flutter/material.dart';

import '../widgets/subjects.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectsScreens extends StatefulWidget {
  const SubjectsScreens({ Key? key }) : super(key: key);

  @override
  State<SubjectsScreens> createState() => _SubjectsScreensState();
}

class _SubjectsScreensState extends State<SubjectsScreens> {
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

      body: GridView.builder(  
         padding:  EdgeInsets.only(left:5.w, right: 5.w, top: 20.h, bottom: 20.h),
              itemCount: 10,  
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                
              ),  
              itemBuilder: (BuildContext context, int index){  
                return const SubjectsWidget(title: 'اسم المادة  ' , imagepath: 'images/folder.png',);
              },  
            ),
    );
  }
}