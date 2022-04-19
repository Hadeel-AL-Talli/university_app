import 'package:flutter/material.dart';
import 'package:university_app/widgets/subject.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({ Key? key }) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('اسم المادة ',style: TextStyle(fontFamily: 'Droid'),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),Color(0xff3AA8F2)
            ])          
         ),        
     ),
      ),
      body: GridView(  
         padding: const EdgeInsets.only(left: 15),
                
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                  
                
              ),  
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/VideosScreen');
                  },
                  child: const SubjectWidget(imagepath:'images/video.png', title: 'الفيديوهات', )),
                InkWell(
                  onTap: (){
                     Navigator.pushNamed(context, '/books_screen');
                  },
                  child: const SubjectWidget(imagepath:'images/book.png', title: 'الكتب', )),
                InkWell(
                  onTap: (){
                     Navigator.pushNamed(context, '/forms_screen');
                  },
                  child: const SubjectWidget(imagepath:'images/form.png', title: 'نماذج', )),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/summary_screen');
                  },
                  child: const SubjectWidget(imagepath:'images/summary.png', title: 'الملخصات', )),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/links_screen');
                  },
                  child: const SubjectWidget(imagepath:'images/link.png', title: 'روابط', )),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/voiceScreen');
                  },
                  child: const SubjectWidget(imagepath:'images/voice.png', title: 'الصوت', )),
                
              ],
               
            ),
    );
  }
}