import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_app/prefs/shared_prefs_controller.dart';
import 'package:university_app/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
        // Navigator.pushReplacementNamed(context, '/SignUp');
        String route = SharedPrefController().loggedIn
          ? '/univ_screen'
          : '/sign_in';
      Navigator.pushReplacementNamed(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff3AA8F2),Color(0xff2D445A)])),
      child: Scaffold(
       backgroundColor: Colors.transparent,
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SvgPicture.asset('images/logo.svg'),
             SizedBox(height: 10.h,),
             Text('دليل الطالب', style: AppUtils.h1,)
            ],
          ),
        ),
      ),
    );
  }
}