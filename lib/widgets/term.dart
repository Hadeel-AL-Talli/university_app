import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TermWidget extends StatelessWidget {
  final String name;
 


  const TermWidget(
      {Key? key,
      required this.name,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, children: [
       
        Container(
          
          width: 380.w,
          height: 100.h,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w , vertical: 15.h),
            child: Column(
              
              children: [
               
                 SizedBox(height: 10.h,),
                Text(name,textAlign: TextAlign.center,style: const TextStyle(color: Colors.blue , fontSize: 22,fontFamily: 'Droid', fontWeight: FontWeight.bold ))
              ],
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,offset: Offset(1,0.3)
              )
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white, ),
       
    
        ),
      
          Positioned(
           top:20.h,
          left: 15.w,
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
