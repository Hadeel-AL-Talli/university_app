import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';

class CustomUnivItem extends StatelessWidget {
  final String nameEN;
  final String nameAR;
  final String imagePath;

  const CustomUnivItem(
      {Key? key,
      required this.nameAR,
      required this.nameEN,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
       
        Container(
          
          width: 310,
          height: 110,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text(nameAR, style: AppUtils.h2),
              SizedBox(height: 10,),
              Text(nameEN,style: TextStyle(color: Colors.blue , fontSize: 20,fontWeight: FontWeight.bold ))
            ],
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,offset: Offset(2,0.6)
              )
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white, ),
       

        ),
        Positioned(
          right: -30,
          top:15,
          child: Container(
            height: 80,
            width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                  color: Colors.grey,
                 offset: Offset(0.2,1.3)
                  
                )
                ]
              ),
            child: Image.asset(imagePath, width: 70, height: 70,),
          ),
        ),
         Positioned(
           top:20,
          left: -20,
           bottom: 20,
          child: CircleAvatar(
             
            maxRadius: 20,
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back_ios ,size: 25, color: Colors.blue,),),
        ),
      ],
    );
  }
}
