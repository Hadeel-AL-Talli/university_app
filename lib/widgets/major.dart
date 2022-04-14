import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';

class MajorWidget extends StatelessWidget {
  final String title;
  const MajorWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          decoration: BoxDecoration(
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
              
              
              style: AppUtils.h2,
            ),
          ),
        ),

         Positioned(
          left: 65,
          bottom: 20,
          child: CircleAvatar(
            maxRadius: 20,
            backgroundColor: Color(AppUtils.blueColor),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
