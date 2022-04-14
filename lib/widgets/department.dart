import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';

class Department extends StatelessWidget {
  final String title;
  const Department({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
    
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 350,
          height: 67,
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
                  0.5,
                  2.0,
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
          left: -15,
          top: 10,
          child: CircleAvatar(
            maxRadius: 25,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Color(AppUtils.blueColor),
            ),
          ),
        ),
      ],
    );
  }
}
