import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class SummaryPDF extends StatefulWidget {
  const SummaryPDF({ Key? key  , required this.res , required this.name}) : super(key: key);

 
 final  String res;
 final String name ;

  @override
  State<SummaryPDF> createState() => _SummaryPDFState();
}

class _SummaryPDFState extends State<SummaryPDF> {
// late  PdfViewerController _pdfViewerController;
  final StreamController<String> _pageCountController =
      StreamController<String>();
      final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  @override
  void initState() {
   // _pdfViewerController = PdfViewerController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar:AppBar(
         actions: <Widget>[
          StreamBuilder<String>(
              stream: _pageCountController.stream,
              builder: (_, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[900],
                      ),
                      child: Text(snapshot.data!),
                    ),
                  );
                }
                return const SizedBox();
              }),
        // IconButton(
        //   icon: Icon(
        //     Icons.keyboard_arrow_up,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
           
        //   //  _pdfViewerController.previousPage();
        //   },
        // ),
        // IconButton(
        //   icon: Icon(
        //     Icons.keyboard_arrow_down,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //    // _pdfViewerController.nextPage();
        //   },
        // )
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
          child:PDF(
             enableSwipe: true,
        
        autoSpacing: false,
        pageFling: true,
            onPageChanged: (int? current, int? total) =>
            _pageCountController.add('${current! + 1} - $total'),
            onViewCreated: (PDFViewController pdfViewController) async {
          _pdfViewController.complete(pdfViewController);
          final int currentPage = await pdfViewController.getCurrentPage() ?? 0;
          final int? pageCount = await pdfViewController.getPageCount();
          _pageCountController.add('${currentPage + 1} - $pageCount');
        },
          ).cachedFromUrl(
              
              widget.res,
              placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
              //  controller: _pdfViewerController, 
             ),
          //child: SfPdfViewer.network(widget.res, controller: _pdfViewerController,),
          
             
             ),
             floatingActionButton: FutureBuilder<PDFViewController>(
        future: _pdfViewController.future,
        builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: '-',
                  child: const Text('-',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
                  onPressed: () async {
                    final PDFViewController pdfController = snapshot.data!;
                    final int currentPage =
                        (await pdfController.getCurrentPage())! - 1;
                    if (currentPage >= 0) {
                      await pdfController.setPage(currentPage);
                    }
                  },
                ),
                FloatingActionButton(
                  heroTag: '+',
                  
                  child: const Text('+', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
                  onPressed: () async {
                    final PDFViewController pdfController = snapshot.data!;
                    final int currentPage =
                        (await pdfController.getCurrentPage())! + 1;
                    final int numberOfPages = await pdfController.getPageCount() ?? 0;
                    if (numberOfPages > currentPage) {
                      await pdfController.setPage(currentPage);
                    }
                  },
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
             );

  }
}