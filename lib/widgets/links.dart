import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LinksWidget extends StatelessWidget {
 final String  link;
  const LinksWidget({ Key? key , required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/VideosScreen');
      },
      child: PhysicalModel(
          color: Colors.white,
          elevation: 18,
          shadowColor: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
          child: ListTile(
           
            title: Text(
              link,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 14.sp,
                
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