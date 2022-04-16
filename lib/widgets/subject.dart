import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectWidget extends StatelessWidget {
  final String imagepath;
  final String title;
  const SubjectWidget({ Key? key , required this.imagepath , required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:(){
 Navigator.pushNamed(context, '/books_screen');
      },
      child: Stack(
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
            width: 170.w,
            height: 155.h,
            child: Center(
              child: Image.asset(imagepath)
            ),
          ),
    
           Positioned(
             right: 20,
            left: 5,
            bottom: 25,
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
              
                style: TextStyle(color: Colors.white, fontSize: 15.sp, fontFamily: 'Droid'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}