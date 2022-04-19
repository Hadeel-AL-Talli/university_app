import 'package:flutter/material.dart';
import 'package:university_app/widgets/books.dart';


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
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('الكتب  '),
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

      body:  GridView.builder(  
         padding: const EdgeInsets.only(left: 15),
              itemCount: 10,  
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                
              ),  
              itemBuilder: (BuildContext context, int index){  
                return const BooksWidget(title: 'اسم الكتاب ' , imagepath: 'images/pdf.png',);
              },  
            ),
    );
  }
}