import 'package:flutter/material.dart';
import 'package:university_app/widgets/term.dart';

class TermScreen extends StatefulWidget {
  const TermScreen({ Key? key }) : super(key: key);

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('التخصص ',style: TextStyle(fontFamily: 'Droid'),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),
              Color(0xff3AA8F2),
            ])          
         ),        
     ),      
 ),

 body: Column(
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   children: const [
   TermWidget(name: 'الفصل الأول '),
   //SizedBox(height: 40.h,),
    TermWidget(name: 'الفصل الثاني  '),

 ]),
    );
  }
}