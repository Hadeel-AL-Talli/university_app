import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SubjectWidget extends StatelessWidget {
  final String imagepath;
  final String title;
  const SubjectWidget({ Key? key , required this.imagepath , required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        Container(

          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.white,offset: Offset(2,0.6)
              )
            ]
              ),
          width: 170,
          height: 155,
          child: Center(
            child: Image.asset(imagepath)
          ),
        ),

         Positioned(
           right: 20,
          left: 5,
          bottom: 40,
          child: Container(
            width: 150,
            height: 35,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Color(AppUtils.blueColor),

             ),
            
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title, 
            
              style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Droid'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}