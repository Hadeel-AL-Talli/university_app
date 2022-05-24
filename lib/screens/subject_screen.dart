import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/resource_type.dart';
import 'package:university_app/screens/audio_screen.dart';
import 'package:university_app/screens/books_screen.dart';
import 'package:university_app/screens/forms_screen.dart';
import 'package:university_app/screens/links_screen.dart';
import 'package:university_app/screens/summary_screen.dart';
import 'package:university_app/screens/video_link.dart';
import 'package:university_app/screens/videos_screen.dart';
import 'package:university_app/screens/voice_screen.dart';
import 'package:university_app/widgets/subject.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({ Key? key  , required this.id , required this.name}) : super(key: key);
  final int id;
  final String name;

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
    late Future<List<ResourceType>> _future;
  List<ResourceType> _resourceType = <ResourceType>[];

  @override
  void initState() {
    
    super.initState();
    _future = HomeApiController().getResourceType();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title:  Text(widget.name,style: TextStyle(fontFamily: 'Droid'),),
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
      body: FutureBuilder<List<ResourceType>>(
        future: _future,
        builder: (context, snapshot) {

           if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else if (snapshot.hasData && snapshot.data!.isNotEmpty){
        _resourceType = snapshot.data ??[];
        print('resource type ');
          return GridView.builder(
            itemCount: _resourceType.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                      crossAxisCount: 2,  
                      
                    
                  ),  itemBuilder: (context , index){
                   
                       return InkWell(
                         onTap: (){
                           if(_resourceType[index].id == 16){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) {
                          return AudioScreen(id: widget.id);
                        })));
                        
                           }

                          if(_resourceType[index].id == 22){
                             Navigator.push(context, MaterialPageRoute(builder: ((context) {
                          return BooksScreen(id: widget.id);
                        })));
                          }
                            if(_resourceType[index].id == 17){
                             Navigator.push(context, MaterialPageRoute(builder: ((context) {
                          return Links(id: widget.id);
                        })));
                          }
                          if(_resourceType[index].id == 18){
                             Navigator.push(context, MaterialPageRoute(builder: ((context) {
                          return SummaryScreen(id: widget.id);
                        })));
                          }
                           if(_resourceType[index].id == 19){
                            
                             Navigator.push(context, MaterialPageRoute(builder: ((context) {
                          return VideosScreen(id: widget.id);
                        })));
                          }
                           if(_resourceType[index].id == 20){
                            
                             Navigator.push(context, MaterialPageRoute(builder: ((context) {
                          return FormsScreen(id: widget.id);
                        })));
                          }
                            if(_resourceType[index].id == 21){
                            
                             Navigator.push(context, MaterialPageRoute(builder: ((context) {
                          return VideoLinks(id: widget.id);
                        })));
                          }
                         },
                         child: SubjectWidget(  title: _resourceType[index].name , imagepath: 'images/link.png', ));
                  });
        }

        else{
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
    );
  }
}