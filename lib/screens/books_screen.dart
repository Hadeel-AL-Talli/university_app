
import 'package:flutter/material.dart';
import 'package:university_app/controllers/home_api_controller.dart';
import 'package:university_app/models/book.dart';
import 'package:university_app/screens/SummaryPDF.dart';
import 'package:university_app/widgets/books.dart';




class BooksScreen extends StatefulWidget {
  const BooksScreen({ Key? key , required this.id }) : super(key: key);
  final int id;

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
   late Future<List<BookModel>> _future;
  List<BookModel> _books = <BookModel>[];

  @override
  void initState() {
    
    super.initState();
    _future = HomeApiController().getBooks(widget.id.toString());
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
        title: const Text('الكتب  ',style: TextStyle(fontFamily: 'Droid'),),
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

      body:  FutureBuilder<List<BookModel>>(
        future: _future,
        builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else if (snapshot.hasData && snapshot.data!.isNotEmpty){
        _books = snapshot.data ??[];
          return GridView.builder(  
             padding: const EdgeInsets.only(left: 15),
                  itemCount: _books.length,  
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                      crossAxisCount: 2,  
                    
                  ),  
                  itemBuilder: (BuildContext context, int index){  
                    return  InkWell(
                      onTap: ()async{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SummaryPDF(res: _books[index].res , name:_books[index].name)));
                      },
                      child: BooksWidget(title: _books[index].name , imagepath: 'images/pdf.png',));
                  },  
                );
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
    );
  }
}