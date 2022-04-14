import 'package:flutter/material.dart';
import 'package:university_app/screens/books_screen.dart';
import 'package:university_app/screens/department_screen.dart';
import 'package:university_app/screens/forms_screen.dart';
import 'package:university_app/screens/major_screen.dart';
import 'package:university_app/screens/sign_in.dart';
import 'package:university_app/screens/splash_screen.dart';
import 'package:university_app/screens/subject_screen.dart';
import 'package:university_app/screens/subjects_screen.dart';
import 'package:university_app/screens/summary_screen.dart';
import 'package:university_app/screens/univ_department.dart';
import 'package:university_app/screens/univ_screen.dart';

import 'screens/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/univ_screen',
      routes: {
        '/splash_screen':(context)=>SplashScreen(),
        '/SignUp':(context)=> SignUp(),
           '/sign_in':((context) => SignIn()),
        '/univ_screen'  :(context)=> UniversitiesScreen(),
        '/univ_department':(context)=> UnivDepartment(), 
        '/department_screen' : (context)=> DepartmentScreen(),
        '/major_screen' :((context) => MajorScreen()),
        '/subject_screen' : ((context) => SubjectScreen()),
        '/subjects_screen':(context)=>SubjectsScreens(),
        '/books_screen':(context)=>BooksScreen(),
        '/summary_screen':(context)=> SummaryScreen(),
        '/forms_screen':(context)=> FormsScreen()        


      },
    );
  }
}
