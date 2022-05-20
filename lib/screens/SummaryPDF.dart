
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class SummaryPDF extends StatefulWidget {
  const SummaryPDF({ Key? key  , required this.res , required this.name}) : super(key: key);

 
 final  String res;
 final String name ;

  @override
  State<SummaryPDF> createState() => _SummaryPDFState();
}

class _SummaryPDFState extends State<SummaryPDF> {
 late  PdfViewerController _pdfViewerController;
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar:AppBar(
         actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
          ),
          onPressed: () {
            _pdfViewerController.previousPage();
          },
        ),
        IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          onPressed: () {
            _pdfViewerController.nextPage();
          },
        )
      ],
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:  const Icon(Icons.arrow_back_ios)),
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
      body: Container(
          child: SfPdfViewer.network(
          
              widget.res,
                controller: _pdfViewerController, 
             ),
             
             ));

  }
}