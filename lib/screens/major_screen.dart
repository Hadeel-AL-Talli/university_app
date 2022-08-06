import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/major_dep.dart';
import 'package:university_app/models/years_model.dart';
import 'package:university_app/screens/term.dart';
import 'package:university_app/widgets/major.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MajorScreen extends StatefulWidget {
  const MajorScreen({ Key? key , required this.id }) : super(key: key);
  final int id ;

  @override
  State<MajorScreen> createState() => _MajorScreenState();
}

class _MajorScreenState extends State<MajorScreen> {
   late Future<List<YearsModel>> _future;
  List<YearsModel> _majorYears = <YearsModel>[];

   List<MajorModel> _major = <MajorModel>[];

  @override
  void initState() {
    
    super.initState();
    _future = HomeApiController().getYears();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('التخصص ',style: TextStyle(fontFamily: 'Droid'),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              
              Color(0xff2D475F),
              Color(0xff3AA8F2),
            ])          
         ),        
     ),      
 ),


 body: Padding(
   padding: const EdgeInsets.only(top:60.0 ),
   child: FutureBuilder<List<YearsModel>>(
     future: _future,
     builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else if (snapshot.hasData && snapshot.data!.isNotEmpty){
        _majorYears = snapshot.data ??[];
        print('years DATA');
         return GridView.builder( 
         padding: const EdgeInsets.only(left:10), 
                    itemCount: _majorYears.length,  
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                        crossAxisCount: 2,   
                      
                    ),  
                    itemBuilder: (BuildContext context, int index){  
                      return  InkWell(
               onTap:()=>  Navigator.push(context, MaterialPageRoute(builder: (context) => TermScreen(mid: widget.id, yid:_majorYears[index].id, ))),

                        child: MajorWidget(title: _majorYears[index].name));
                    },  
                  );
      }
      else {
         return Column(
            mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Image.asset('images/nodata.jpg', height: 250.h, width: 250.w,),
                      Center(
                        child: Text(
                          'سيتم إضافتها قريباً ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      )
                    ],
                  );
      }
     }
   ),
 ),
    );
  }
}