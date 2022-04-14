import 'package:flutter/material.dart';
import 'package:university_app/widgets/univ_department.dart';

class UnivDepartment extends StatefulWidget {
  const UnivDepartment({ Key? key }) : super(key: key);

  @override
  State<UnivDepartment> createState() => _UnivDepartmenetState();
}

class _UnivDepartmenetState extends State<UnivDepartment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: Text('أقسام الجامعات'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),Color(0xff3AA8F2)
            ])          
         ),        
     ),      
 ),

 body:GridView.builder(  
         
              itemCount: 10,  
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                
              ),  
              itemBuilder: (BuildContext context, int index){  
                return UnivDepartmentWidget(title: 'القسم الأول');
              },  
            ),
    );
  }
}