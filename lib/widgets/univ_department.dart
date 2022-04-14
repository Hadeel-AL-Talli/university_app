import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';

class UnivDepartmentWidget extends StatelessWidget {

 // final String imagePath ; 
  final String title ; 

  const UnivDepartmentWidget({ Key? key  , required this.title}) : super(key: key);

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
              borderRadius: BorderRadius.only(
                  
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)), ),
          width: 170,
          height: 155,
          child: Center(
            child: Text(
              title,
              
              
              style: AppUtils.h1,
            ),
          ),
        ),
       
         Positioned(
          
          bottom: 140,
         left: 50,
          child: Image.asset('images/department.png', width: 70 , height: 70,)), 

         Positioned(
          left: 65,
          bottom: 20,
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
    );

















  
  }
}