import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_app/utils/constants.dart';
import 'package:university_app/widgets/app_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
 
   late TextEditingController _email ;
    late TextEditingController _password ;  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    _email = TextEditingController();
    _password = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
         image: DecorationImage(image: AssetImage('images/bc.png'),fit:BoxFit.cover),
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [Color(0x3AA8F2),Color(0x2C3E50)]
          //     )
              ),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(children: [
            
            SizedBox(height: 100.h,),
            SvgPicture.asset('images/logo.svg'),
                 SizedBox(height: 10.h,),
                 Text('دليل الطالب', style: AppUtils.h3White),
        
                 SizedBox(height: 80.h,),
        
        
               
                 Container(
                    margin: const EdgeInsets.only(right: 50 , left: 50),
                   child: AppTextField(hint: 'رقم الجوال أو الايميل ', controller: _email)),

                   SizedBox(height: 30.h,),
                  Container(
                     margin: const EdgeInsets.only(right: 50 , left: 50),
                    child: AppTextField(hint: 'كلمة السر  ', controller: _password)), 
        
        
                   
        
          ],),
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            height:83.h,
    width: 83.h,
    decoration: BoxDecoration(
      gradient:const LinearGradient(colors: [Color(0xff3AA8F2),Color(0xff2D475F)]),
    
       
        borderRadius: BorderRadius.circular(100) 
        //more than 50% of width makes circle
    ),
            child: InkWell(
              onTap: (){
                 Navigator.pushNamed(context, '/univ_screen');
              },
              child: Container(
              
               
                 child: Column(
                 //  crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                      SizedBox(height: 15.h,),
                     Text('تسجيل  ' ,
                      style: TextStyle(fontSize: 12.sp ,fontWeight: FontWeight.bold , fontFamily: 'Droid' , color: Colors.white),),
                      Text('الدخول   ' ,textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.sp ,fontWeight: FontWeight.bold , fontFamily: 'Droid',color: Colors.white),),
                   ],
                 ),
               
               
                // onPressed: (){
            
                //   //
                //   Navigator.pushNamed(context, '/univ_screen');
                // }
                ),
            ),
          ),
        ),
      ),
    );
  }
}