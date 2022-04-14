import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';
import 'package:university_app/widgets/custom_university_item.dart';

class UniversitiesScreen extends StatefulWidget {
  const UniversitiesScreen({ Key? key }) : super(key: key);

  @override
  State<UniversitiesScreen> createState() => _UniversitiesScreenState();
}

class _UniversitiesScreenState extends State<UniversitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title: Text(' الجامعات'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Color(0xff3AA8F2),
              Color(0xff2D475F)
            ])          
         ),        
     ),      
 ),

 body: Stack(
   children: [
     Positioned(
       right: -20,
        top:20,
       child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),Color(0xff3AA8F2),
            ])     
          ),
         height: 650,
         width: 103,
        
       ),
     ),
     ListView.builder(
       itemCount: 10,
       itemBuilder:((context, index) {
              return Column(
                children: [
                  SizedBox(height: 15,),
                  CustomUnivItem(nameAR: 'جامعة العلوم والتكنولوجيا', nameEN: '''University of science &
 Technology''',
                  
                  
                   imagePath: 'images/univ.png')
                ],
              );
     })),

     
   ],
 ),
    );
  }
}