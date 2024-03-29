import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:university_app/screens/books_screen.dart';
import 'package:university_app/screens/department_screen.dart';
import 'package:university_app/screens/forms_screen.dart';
import 'package:university_app/screens/how_to_register.dart';
import 'package:university_app/screens/info_screen.dart';
import 'package:university_app/screens/links_screen.dart';
import 'package:university_app/screens/major_screen.dart';
import 'package:university_app/screens/sign_in.dart';
import 'package:university_app/screens/splash_screen.dart';
import 'package:university_app/screens/subject_screen.dart';
import 'package:university_app/screens/subjects_screen.dart';
import 'package:university_app/screens/summary_screen.dart';
import 'package:university_app/screens/term.dart';
import 'package:university_app/screens/univ_department.dart';
import 'package:university_app/screens/univ_screen.dart';
import 'package:university_app/screens/videos_screen.dart';
import 'package:university_app/screens/voice_screen.dart';

import 'prefs/shared_prefs_controller.dart';
import 'screens/sign_up.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(
    const MyApp()
    
    );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375 ,812),
      builder: ((context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash_screen',
        routes: {
          '/splash_screen':(context)=>const SplashScreen(),
          '/SignUp':(context)=> const SignUp(),
             '/sign_in':((context) => const SignIn()),
          '/univ_screen'  :(context)=> const UniversitiesScreen(),
          '/info':(context)=> const Info(),
          '/how_to_register':(context) => HowToRegister()
        //  '/univ_department':(context)=> const UnivDepartment(), 
         // '/department_screen' : (context)=> const DepartmentScreen(),
         // '/major_screen' :((context) => const MajorScreen()),
        //  '/term_screen':(context)=>const TermScreen(),
        //  '/subject_screen' : ((context) => const SubjectScreen()),
        //  '/subjects_screen':(context)=>const SubjectsScreens(),
         // '/books_screen':(context)=>const BooksScreen(),
         // '/summary_screen':(context)=> const SummaryScreen(),
         // '/forms_screen':(context)=> const FormsScreen()     ,
         // '/links_screen':(context)=> const Links()  ,
         // '/VideosScreen' :(context)=> const VideosScreen() ,
         // '/voiceScreen':(context)=> const Voice()
    
    
        },
      )),
      
    );
      
    
  }
}
