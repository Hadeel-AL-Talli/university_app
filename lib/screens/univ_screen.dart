import 'package:flutter/material.dart';
import 'package:university_app/controllers/auth_api_controller.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/university.dart';
import 'package:university_app/screens/department_screen.dart';
import 'package:university_app/screens/univ_department.dart';
import 'package:university_app/widgets/custom_university_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UniversitiesScreen extends StatefulWidget {
  const UniversitiesScreen({ Key? key }) : super(key: key);

  @override
  State<UniversitiesScreen> createState() => _UniversitiesScreenState();
}

class _UniversitiesScreenState extends State<UniversitiesScreen> {

  late Future<List<University>> _future;
  List<University> _university = <University>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = HomeApiController().getUniversities();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        automaticallyImplyLeading: false,
      centerTitle: true,
        title: const Text(' الجامعات'  , style: TextStyle(fontFamily: 'Droid'),),
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
     actions: [
        IconButton(onPressed: () {
          Navigator.pushNamed(context, '/info');
       }, icon: Icon(Icons.info)
       ),
       IconButton(onPressed: () async{
          await logout(context);
       }, icon: Icon(Icons.logout)
       ),
       
     ],   
 ),

 body: Stack(
   children: [
     Positioned(
       right: -20,
        top:20,
       child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),Color(0xff3AA8F2),
            ])     
          ),
         height: 650.h,
         width: 103.w,
        
       ),
     ),
     FutureBuilder<List<University>>(
       future: _future,
       builder: (context , snapshot){
         if(snapshot.connectionState == ConnectionState.waiting){
           return Center(child: CircularProgressIndicator(),);
         }
         else if (snapshot.hasData && snapshot.data!.isNotEmpty){
           _university = snapshot.data ?? [];
           return ListView.builder(
         itemCount: _university.length,
         itemBuilder:((context, index) {
                return  Column(
                    children: [
                      SizedBox(height: 15.h,),
                       InkWell(
                         onTap:()=>  Navigator.push(context, MaterialPageRoute(builder: (context) => UnivDepartment(id: _university[index].id))),
                         child: CustomUnivItem(nameAR: _university[index].name,
                                             
                                             
                                             imagePath:_university[index].photo
                         ),
                       ),
                    ],
                  );
                
       }));
         }else {
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

       },
     ),

     
   ],
 ),
    );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut) Navigator.pushReplacementNamed(context, '/sign_in');
  }
}