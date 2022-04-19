import 'package:flutter/material.dart';
import 'package:university_app/widgets/links.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Links extends StatefulWidget {
  const Links({ Key? key }) : super(key: key);

  @override
  State<Links> createState() => _LinksState();
}

class _LinksState extends State<Links> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('الروابط  ',style: TextStyle(fontFamily: 'Droid'),),
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


      body: Padding(
        padding: const EdgeInsets.only(top:30.0),
        child: ListView.builder(
         
          itemCount: 20,
          itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 10.h,),
              const LinksWidget(link: 'رابط الفيديو'),
            ],
          );
        },),
      ),
    );
  }
}