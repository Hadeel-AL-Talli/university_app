import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class VoiceWidget extends StatelessWidget {
 final String  link;
  const VoiceWidget({ Key? key , required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return InkWell(
      onTap: (){
        //
      },
      child: PhysicalModel(
          color: Colors.white,
          elevation: 18,
          shadowColor: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
          child: ListTile(
           trailing: SvgPicture.asset('images/play.svg'),
            title: Text(
              link,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Droid',
                color: Colors.blueAccent,
              ),
            ),
          
          ),
        ),
    );
    // return Material(
    //   elevation: 21,
    //   shadowColor: Colors.grey.shade100,
    //   child: ListTile(
    //    shape: RoundedRectangleBorder(
    //      borderRadius: BorderRadius.circular(15)
    //    ),
    //     title: Text(link ,style: TextStyle(fontSize: 14,fontFamily: 'Droid' ),),
    //   ),
    // );
  }
}