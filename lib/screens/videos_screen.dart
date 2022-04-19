import 'package:flutter/material.dart';
import 'package:university_app/widgets/videos.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({ Key? key }) : super(key: key);

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('الفيديوهات  '),
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

      body: GridView.builder(
        padding: const EdgeInsets.only(left: 15),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    

                ),
                itemBuilder: (BuildContext context, int index){
                 return const VideosWidget(title: 'عنوان الفيديو', imagepath: 'images/vd.png');
                },
              ),

    
    );
  }
}