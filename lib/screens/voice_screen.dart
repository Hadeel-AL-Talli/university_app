import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:university_app/widgets/voice.dart';


class Voice extends StatefulWidget {
  const Voice({ Key? key }) : super(key: key);

  @override
  State<Voice> createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('الأصوات  '),
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
              const VoiceWidget(link: ' اسم الصوت'),
            ],
          );
        },),
      ),
    );
  }
}