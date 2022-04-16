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
    return InkWell(
      onTap:(){
         Navigator.pushNamed(context, '/univ_department');
      },
      child: Stack(
        overflow: Overflow.visible,
        children: [
         
          Container(
            
            width: 310,
            height: 130,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text(nameAR, style: AppUtils.h2),
                SizedBox(height: 10,),
                Text(nameEN,style: TextStyle(color: Colors.blue , fontSize: 18,fontFamily: 'Droid', fontWeight: FontWeight.bold ))
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
            top:20,
            child: Container(
              height: 90,
              width: 75,
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
      ),
    );
  }
}
