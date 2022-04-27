import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UnivDepartmentWidget extends StatelessWidget {

 // final String imagePath ; 
  final String title ; 

  const UnivDepartmentWidget({ Key? key  , required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/department_screen');
      },
      child: Stack(
        
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
            height: 160.h,
            child: Center(
              child: Text(
                title,
                
                
                style: AppUtils.h1,
              ),
            ),
          ),
         
           Positioned(
            top:-20.h,
            
           left: 50.w,
            child: Image.asset('images/department.png', width: 80.w , height: 80.h,)), 
    
           Positioned(
            left: 65.w,
            bottom: 22.h,
            child: CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Color(AppUtils.blueColor),
              ),
            ),
          ),
        ],
      ),
    );

















  
  }
}