import 'package:flutter/material.dart';
import 'package:university_app/widgets/major.dart';

class MajorScreen extends StatefulWidget {
  const MajorScreen({ Key? key }) : super(key: key);

  @override
  State<MajorScreen> createState() => _MajorScreenState();
}

class _MajorScreenState extends State<MajorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('التخصص '),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),
              Color(0xff3AA8F2),
            ])          
         ),        
     ),      
 ),


 body: Padding(
   padding: const EdgeInsets.only(top:60.0 ),
   child: GridView.builder( 
     padding: const EdgeInsets.only(left:10), 
                itemCount: 10,  
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                    crossAxisCount: 2,  
                  
                ),  
                itemBuilder: (BuildContext context, int index){  
                  return const MajorWidget(title: 'سنة أولى');
                },  
              ),
 ),
    );
  }
}