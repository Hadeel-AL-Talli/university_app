import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/resource_type.dart';
import 'package:university_app/widgets/subject.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({ Key? key }) : super(key: key);

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
      body: FutureBuilder<List<ResourceType>>(
        future: _future,
        builder: (context, snapshot) {

           if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else if (snapshot.hasData && snapshot.data!.isNotEmpty){
        _resourceType = snapshot.data ??[];
          return GridView.builder(
            itemCount: _resourceType.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                      crossAxisCount: 2,  
                      
                    
                  ),  itemBuilder: (context , index){
                   
                       return SubjectWidget(  title: _resourceType[index].name , imagepath: 'images/link.png', );
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