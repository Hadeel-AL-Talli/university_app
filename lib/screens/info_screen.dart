import 'package:flutter/material.dart';
import 'package:university_app/utils/constants.dart';

class Info extends StatelessWidget {
  const Info({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
      centerTitle: true,
        title: const Text(''  , style: TextStyle(fontFamily: 'Droid'),),
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
      body: ListView(
        children: [
          Center(child: Text('عن التطبيق ',textAlign: TextAlign.right, style: TextStyle(color: Colors.black , fontFamily: 'Droid' , fontWeight: FontWeight.bold , fontSize: 18))),
          SizedBox(height: 15,),
         
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('''
            تطبيق موسوعتي الجامعيه وهوه تطبيق يضم كل ما يفيد الطالب الجامعي من شروحات وكتب ومراجع ومحاضرات سواء كانت صوت او فيديو بالاضافه الى نماذج للأمتحانات فيما يخص كل الجامعات و المعاهد الموجوده في اليمن
مدعوم بشكل رسمي من وزارة التعليم العالي

   ''' , textAlign: TextAlign.right,style: TextStyle(color: Colors.black45, fontFamily: 'Droid', fontSize: 15),),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text('عن الشركة',textAlign: TextAlign.right, style: TextStyle(color: Colors.black , fontFamily: 'Droid' , fontWeight: FontWeight.bold , fontSize: 18)
              ),
            ),
        
          ),
           Image.asset('images/company.png', height: 250,width: double.infinity,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(' DRAGON SOFT شركة   \n وهي شركة مختصة في مجال الاتصالات والبرمجة وأنظمة الطاقة البديلة موقعها الرسمي في اليمن', textAlign: TextAlign.right,style: TextStyle(color: Colors.black45, fontFamily: 'Droid', fontSize: 15),),
          )
        ],
      ),
    );
  }
}