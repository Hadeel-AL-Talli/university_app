import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BooksWidget extends StatelessWidget {
  final String title;
  final String imagepath;
  const BooksWidget({ Key? key , required this.title , required this.imagepath }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.pushNamed(context, '/summary_screen');
      },
      child: Stack(
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
                  color: Colors.white,offset: Offset(1.0,1.0)
                ),
                 
              ]
                ),
            width: 170.w,
            height: 165.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 10.h,),
                Center(
                  child: Image.asset(imagepath),
    
                ),
    
                
                Text(title ,style:TextStyle(color: Color(0xff377198) , fontSize: 16.sp , fontFamily: 'Droid' , fontWeight: FontWeight.bold))
              ],
            ),
          ),
    
           
        ],
      ),
    );
  }
}