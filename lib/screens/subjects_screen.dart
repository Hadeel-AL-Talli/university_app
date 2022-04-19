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
       backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('المواد  '),
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
         padding: const EdgeInsets.only(left:15),
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