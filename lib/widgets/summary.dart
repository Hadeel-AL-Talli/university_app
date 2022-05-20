import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SummaryWidget extends StatelessWidget {
  final String title;
  final String imagepath;
  const SummaryWidget({ Key? key , required this.title , required this.imagepath }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                color: Colors.white,offset: Offset(1.0,1.0)
              ),
               
            ]
              ),
          width: 170.w,
          height: 170.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 10.h,),
              Expanded(
                flex:3,
                child: Center(
                  child: Image.asset(imagepath),
                  
                ),
              ),
    
              
              Expanded(
                flex:2,
                child: Text(title ,style:const TextStyle(color: Color(0xff377198) , fontSize: 16 , fontFamily: 'Droid' , fontWeight: FontWeight.bold)))
            ],
          ),
        ),
    
         
      ],
    );
  }
}