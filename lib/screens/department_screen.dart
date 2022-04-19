import 'package:flutter/material.dart';
import 'package:university_app/widgets/department.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({ Key? key }) : super(key: key);

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('القسم '),
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

 body: ListView.builder(
   itemCount: 10,
   itemBuilder: (context, index) {
   return Column(
     children: [

       SizedBox(height: 20.h,),
const Department(title: 'التخصص الأول  ')
     ],
   );
 },),
    );
  }
}