import 'package:flutter/material.dart';

import '../widgets/subjects.dart';

class SubjectsScreens extends StatefulWidget {
  const SubjectsScreens({ Key? key }) : super(key: key);

  @override
  State<SubjectsScreens> createState() => _SubjectsScreensState();
}

class _SubjectsScreensState extends State<SubjectsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: Text('المواد  '),
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

      body: GridView.builder(  
         
              itemCount: 10,  
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                
              ),  
              itemBuilder: (BuildContext context, int index){  
                return SubjectsWidget(title: 'الكتب ' , imagepath: 'images/folder.png',);
              },  
            ),
    );
  }
}