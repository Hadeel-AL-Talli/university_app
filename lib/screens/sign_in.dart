import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';
import 'package:university_app/widgets/app_text_field.dart';
import 'package:university_app/widgets/custom_university_item.dart';
import 'package:university_app/widgets/department.dart';
import 'package:university_app/widgets/univ_department.dart';

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
            
            SizedBox(height: 100,),
            Image.asset('images/logo.png'),
                 SizedBox(height: 10,),
                 Text('دليل الطالب', style: AppUtils.h3White),
        
                 SizedBox(height: 80,),
        
        
               
                 Container(
                    margin: EdgeInsets.only(right: 50 , left: 50),
                   child: AppTextField(hint: 'رقم الجوال أو الايميل ', controller: _email)),

                   SizedBox(height: 30,),
                  Container(
                     margin: EdgeInsets.only(right: 50 , left: 50),
                    child: AppTextField(hint: 'كلمة السر  ', controller: _password)), 
        
        
                   
        
          ],),
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            height:83,
    width: 83,
    decoration: BoxDecoration(
      gradient:LinearGradient(colors: [Color(0xff3AA8F2),Color(0xff2D475F)]),
     boxShadow: [
       BoxShadow(
         color: Color(AppUtils.blueColor),
         offset: Offset(1.0, 2.0),
         blurRadius: 1.0,
        
       )
     ],
       
        borderRadius: BorderRadius.circular(100) 
        //more than 50% of width makes circle
    ),
            child: FloatingActionButton(
            
              backgroundColor: Colors.blue,
             
              elevation: 1,
              child: Text('تسجيل الدخول ', style: TextStyle(fontSize: 15  ,fontWeight: FontWeight.bold , fontFamily: 'Droid'),),
              onPressed: (){}),
          ),
        ),
      ),
    );
  }
}