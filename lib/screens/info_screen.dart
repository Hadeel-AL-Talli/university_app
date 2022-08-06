import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_app/utils/constants.dart';

class Info extends StatelessWidget {
  const Info({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     elevation: 0,
      //     backgroundColor: Colors.transparent,
      //     title: const Text(
      //       'About',
      //       style: TextStyle(
      //           color: Colors.black,
      //           fontFamily: 'Poppins',
      //           fontSize: 22,
      //           fontWeight: FontWeight.w700),
      //     ),
      //     leading: GestureDetector(
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //         child: const Icon(
      //           Icons.arrow_back_ios,
      //           color: Colors.black,
      //         )),
      //   ),
      appBar: AppBar(

        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
      centerTitle: true,
        title: const Text('About'  , style: TextStyle(fontFamily: 'Droid'),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),Color(0xff3AA8F2),
            ])          
         ),        
     ),   
     
 ),

 body: Container(
          margin: const EdgeInsets.all(20),
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child:  ListView(
           
            children:  [
              Center(child: Text('عن التطبيق ',textAlign: TextAlign.right, style: TextStyle(color: Colors.black , fontFamily: 'Droid' , fontWeight: FontWeight.bold , fontSize: 15))),
          SizedBox(height: 10,),
                      SvgPicture.asset('images/logo.svg' , height: 70, width: 70,),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('''
            تطبيق موسوعتي الجامعيه وهوه تطبيق يضم كل ما يفيد الطالب الجامعي من شروحات وكتب ومراجع ومحاضرات سواء كانت صوت او فيديو بالاضافه الى نماذج للأمتحانات فيما يخص كل الجامعات و المعاهد الموجوده في اليمن
مدعوم بشكل رسمي من وزارة التعليم العالي

   ''' , textAlign: TextAlign.right,style: TextStyle(color: Colors.black45, fontFamily: 'Droid', fontSize: 15),),
          ),
          Center(
            child: Text('عن الشركة',textAlign: TextAlign.right, style: TextStyle(color: Colors.black , fontFamily: 'Droid' , fontWeight: FontWeight.bold , fontSize: 18)
            ),
          ),
           Image.asset('images/company.png', height: 100),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(' DRAGON SOFT شركة   \n وهي شركة مختصة في مجال الاتصالات والبرمجة وأنظمة الطاقة البديلة موقعها الرسمي في اليمن', textAlign: TextAlign.right,style: TextStyle(color: Colors.black45, fontFamily: 'Droid', fontSize: 15),),
          )
            ],
          )),
//      
    );
  }
}