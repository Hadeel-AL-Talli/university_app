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
    return InkWell(
      onTap:(){
         Navigator.pushNamed(context, '/subjects_screen');
      },
      child: Stack(
        clipBehavior: Clip.none, children: [
         
          Container(
            
            width: 380.w,
            height: 90.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
              child: Column(
                
                children: [
                 
                  const SizedBox(height: 10,),
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
        
           const Positioned(
             top:20,
            left: 15,
             bottom: 20,
            child: CircleAvatar(
               
              maxRadius: 20,
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back_ios ,size: 25, color: Colors.blue,),),
          ),
        ],
      ),
    );
  }
}
