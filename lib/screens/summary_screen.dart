
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/summary.dart';
import 'package:university_app/screens/SummaryPDF.dart';
import 'package:university_app/widgets/summary.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({ Key? key, required this.id }) : super(key: key);
  final int id ;

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
   late Future<List<SummaryModel>> _future;
  List<SummaryModel> _summary = <SummaryModel>[];

  @override
  void initState() {
    
    super.initState();
    _future = HomeApiController().getSummary(widget.id.toString());
    
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
    appBar:  AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      centerTitle: true,
        title: const Text('الملخصات  ',style: TextStyle(fontFamily: 'Droid'),),
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

      body:  FutureBuilder<List<SummaryModel>>(
        future: _future,
        builder: (context, snapshot) {
          
             if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else if (snapshot.hasData && snapshot.data!.isNotEmpty){
        _summary = snapshot.data ??[];
          return GridView.builder(  
               padding: const EdgeInsets.only(left: 15),
                  itemCount: _summary.length,  
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                      crossAxisCount: 2,  
                    
                  ),  
                  itemBuilder: (BuildContext context, int index){  
                    return  InkWell(
                      onTap: () async{
                         print('doc');
                     
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> SummaryPDF(res: _summary[index].res , name:_summary[index].name)));
                                  
      
                         
                      },
                      child: SummaryWidget(title: _summary[index].name , imagepath: 'images/pw.png',));
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
    );
  }
}