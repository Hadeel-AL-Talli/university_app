import 'package:flutter/material.dart';
import 'package:university_app/widgets/univ_department.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UnivDepartment extends StatefulWidget {
  const UnivDepartment({ Key? key }) : super(key: key);

  @override
  State<UnivDepartment> createState() => _UnivDepartmenetState();
}

class _UnivDepartmenetState extends State<UnivDepartment> {
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
   child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    

                ),
                itemBuilder: (BuildContext context, int index){
                  return const UnivDepartmentWidget(title: 'القسم الأول');
                },
              ),
 ),
    );
  }
}