import 'package:flutter/material.dart';
import 'package:university_app/widgets/subjects.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({ Key? key }) : super(key: key);

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
    appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: Text('النماذج  '),
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

      body:  GridView.builder(  
         
              itemCount: 10,  
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                
              ),  
              itemBuilder: (BuildContext context, int index){  
                return SubjectsWidget(title: 'اسم النموذج ' , imagepath: 'images/pdf.png',);
              },  
            ),
    );
  }
}