import 'package:flutter/material.dart';
import 'package:university_app/widgets/subjects.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({ Key? key }) : super(key: key);

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
    appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: Text('الكتب  '),
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
                return SubjectsWidget(title: 'اسم الكتاب ' , imagepath: 'images/pdf.png',);
              },  
            ),
    );
  }
}