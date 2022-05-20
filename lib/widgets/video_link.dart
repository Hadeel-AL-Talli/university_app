import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoLinksWidget extends StatelessWidget {
 final String  link;
 final String res;
  const VideoLinksWidget({ Key? key , required this.link , required this.res}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return InkWell(
      onTap: (){
        _launchUrl();
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

   void _launchUrl() async {
    Uri url = Uri.parse(res);
  if (!await launchUrl(url)) throw 'Could not launch $url';
}
}