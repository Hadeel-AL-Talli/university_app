import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/links.dart';
import 'package:university_app/models/video_link.dart';
import 'package:university_app/widgets/links.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:university_app/widgets/video_link.dart';


class VideoLinks extends StatefulWidget {
  const VideoLinks({ Key? key , required this.id}) : super(key: key);
  final int id ;

  @override
  State<VideoLinks> createState() => _VideoLinksState();
}

class _VideoLinksState extends State<VideoLinks> {
   late Future<List<VideoLinksModel>> _future;
  List<VideoLinksModel> _videolinks = <VideoLinksModel>[];

  @override
  void initState() {
    
    super.initState();
    _future = HomeApiController().getVideoUrl(widget.id.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('الروابط  ',style: TextStyle(fontFamily: 'Droid'),),
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


      body: Padding(
        padding: const EdgeInsets.only(top:30.0),
        child: FutureBuilder<List<VideoLinksModel>>(
          future: _future,
          builder: (context, snapshot) {

             if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else if (snapshot.hasData && snapshot.data!.isNotEmpty){
         _videolinks = snapshot.data ??[];
            return ListView.builder(
             
              itemCount: _videolinks.length,
              itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: 10.h,),
                  VideoLinksWidget(link: _videolinks[index].name , res: _videolinks[index].res,),
                ],
              );
            },);

      }
      else {
 return Center(
              child: Column(
                children: const [
                  Icon(Icons.warning, size: 80),
                  Text(
                    'NO DATA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            );
      }
          }
        ),
      ),
    );
  }
}