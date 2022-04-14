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
        }, icon: Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: Text('التخصص '),
        flexibleSpace: Container(
          decoration: BoxDecoration(
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


 body: GridView.builder(  
              itemCount: 10,  
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                
              ),  
              itemBuilder: (BuildContext context, int index){  
                return MajorWidget(title: 'سنة أولى');
              },  
            ),
    );
  }
}