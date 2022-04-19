import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Department extends StatelessWidget {
  final String title;
  const Department({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/major_screen');
      },
      child: Stack(
      
        clipBehavior: Clip.none,
        children: [
          Container(
           
            width: 330.w,
            height: 67.h,
            child: Center(
              child: Text(
                 title,
         
               
                
                style:AppUtils.h1
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: const[
                BoxShadow(
                  color: Colors.grey,
                  offset:  Offset(
                    0.1,
                    1.0,
                  ),
                ),
              ],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(30)),
              color: Color(AppUtils.blueColor),
            ),
          ),
          Positioned(
            left: -10,
            top: 6,
            child: Container(

              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: 0.3)
                ]
              ),
              
              child: CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Color(AppUtils.blueColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
