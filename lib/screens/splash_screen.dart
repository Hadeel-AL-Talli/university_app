import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
   Navigator.pushReplacementNamed(context, '/SignUp');
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
             Image.asset('images/logo.png'),
             SizedBox(height: 10,),
             Text('دليل الطالب', style: AppUtils.h1,)
            ],
          ),
        ),
      ),
    );
  }
}