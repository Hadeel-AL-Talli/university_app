import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              
              
              style: AppUtils.h2,
            ),
          ),
        ),
    
         Positioned(
          left: 65.w,
          bottom: 40.h,
          child: CircleAvatar(
            maxRadius: 20,
            backgroundColor: Color(AppUtils.blueColor),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
