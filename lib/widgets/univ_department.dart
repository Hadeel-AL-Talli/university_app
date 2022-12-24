import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UnivDepartmentWidget extends StatelessWidget {

 // final String imagePath ; 
  final String title ; 

  const UnivDepartmentWidget({ Key? key  , required this.title ,
  // required this.imagePath
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      
      clipBehavior: Clip.none,
      children: [
       
       
        Container(
         
          decoration: BoxDecoration(
            color: Color(AppUtils.blueColor),
            border: Border.all(
              width: 1,
              color: Color(AppUtils.blueColor),
            ),
              borderRadius: const BorderRadius.only(
                  
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)), ),
          width: 170.w,
          height: 155.h,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              
              style: AppUtils.h1,
            ),
          ),
        ),
       
        //  Positioned(
        //   top:-20.h,
          
        //  left: 50.w,
        //   child: Image.network(imagePath,
        //    width: 80.w , height: 80.h,)), 
    
        //  Positioned(
        //   left: 65.w,
        //   bottom: 27.h,
        //   child: CircleAvatar(
        //     maxRadius: 20,
        //     backgroundColor: Colors.white,
        //     child: Icon(
        //       Icons.arrow_back_ios,
        //       size: 20,
        //       color: Color(AppUtils.blueColor),
        //     ),
        //   ),
        // ),
      ],
    );

















  
  }
}