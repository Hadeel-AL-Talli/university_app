import 'package:flutter/material.dart';
import 'package:university_app/screens/univ_department.dart';
import 'package:university_app/utils/constants.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomUnivItem extends StatelessWidget {
  //final String nameEN;
  final String nameAR;
  final String imagePath;


  const CustomUnivItem(
      {Key? key,
      required this.nameAR,
     // required this.nameEN,
      required this.imagePath 
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, children: [
       
        Container(
          
          width: 310.w,
          height: 130.h,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              
              children: [
                SizedBox(height: 40.h,),
                Text(nameAR, style: AppUtils.h2),
                
               // Text(nameEN,style: const TextStyle(color: Colors.blue , fontSize: 15,fontFamily: 'Droid', fontWeight: FontWeight.bold ))
              ],
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,offset: Offset(2,0.6)
              )
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white, ),
       
    
        ),
        Positioned(
          right: -20.w,
          top:20.h,
          child: Container(
            height: 90.h,
            width: 75.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
    
                boxShadow: const [
                  BoxShadow(
                  color: Colors.grey,
                 offset: Offset(0.2,1.3)
                  
                )
                ]
              ),
            //child: Image.network(imagePath, width: 70.w, height: 70.h,),
                          child: Image.network(imagePath, width: 70.w, height: 70.h,),
          ),
        ),
          Positioned(
           top:20.h,
          left: -20.w,
           bottom: 20.h,
          child: CircleAvatar(
             
            maxRadius: 20,
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back_ios ,size: 25, color: Colors.blue,),),
        ),
      ],
    );
  }
}
