
import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/form.dart';
import 'package:university_app/screens/SummaryPDF.dart';
import 'package:university_app/widgets/forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FormsScreen extends StatefulWidget {
  const FormsScreen({ Key? key , required this.id  }) : super(key: key);
  final int id; 

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
    late Future<List<FormModel>> _future;
  List<FormModel> _form = <FormModel>[];

  @override
  void initState() {
    
    super.initState();
    _future = HomeApiController().getFormSample(widget.id.toString());
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
        title: const Text('النماذج  ',style: TextStyle(fontFamily: 'Droid'),),
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

      body:  FutureBuilder<List<FormModel>>(
        future: _future,
        builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else if (snapshot.hasData && snapshot.data!.isNotEmpty){
        _form = snapshot.data ??[];
          return GridView.builder(  
              padding: const EdgeInsets.only(left: 15),
                  itemCount: _form.length,  
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                      crossAxisCount: 2,  
                    
                  ),  
                  itemBuilder: (BuildContext context, int index){  
                    return InkWell(
                      onTap: () async{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SummaryPDF(res: _form[index].res , name:_form[index].name)));
                      },
                      child: FormsWidget(title: _form[index].name , imagepath: 'images/pdf.png',));
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