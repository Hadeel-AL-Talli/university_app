import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideosWidget extends StatelessWidget {
  final String title;
  final String imagepath;
  const VideosWidget({ Key? key , required this.title , required this.imagepath }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       
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
              boxShadow: const [
               BoxShadow(
                  color: Colors.white,offset: Offset(2.0,1.0)
                ),
                 
              ]
                ),
            width: 170.w,
            height: 174.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 15.h,),
                Center(
                  child: Image.asset(imagepath),
    
                ),
    
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   SizedBox(width: 10.w,),
                    Text(title ,style:TextStyle(color: const Color(0xff377198) , fontSize: 16.sp , fontFamily: 'Droid' ,)),
                     Image.asset('images/film.png',),
                  ],
                )
              ],
            ),
          ),
    
           
        ],
      ),
    );
  }
}