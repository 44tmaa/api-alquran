import 'package:flutter/material.dart';
import 'post_model.dart';

class PostDetail extends StatefulWidget{
   final SurahDetail surahDetail;
  
   const PostDetail({super.key, required this.surahDetail});


   @override
   _PostDetailState createState() => _PostDetailState();

 }
 class _PostDetailState extends State<PostDetail>{
     List <Ayat> filterredAyat = [];
     @override
     void initState(){
       super.initState();
       filterredAyat = widget.surahDetail.ayat ?? [];
     }
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text("Detail Page",style: TextStyle(color: Colors.purple)),
       ),
       body: ListView.builder(
         itemCount: filterredAyat.length,
         itemBuilder: (context,index){
           final ayat = filterredAyat[index];
         return SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(12.0),
             child: Column(
               children: <Widget>[
                 ListTile(
                   title: CircleAvatar(backgroundColor: Colors.purple,child: Text(ayat.nomor.toString(),
                   style: TextStyle(
                     color: Colors.white
                   ),
                   ),
                   ),
                 ),
                 ListTile(
                   title: const Text("Title", style: TextStyle(color: Colors.purple)),
                   subtitle: Text(ayat.ar.toString(),
                   style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.purple)),
                 ),
                 ListTile(
                   title: const Text("body", style: TextStyle(color: Colors.purple)),
                   subtitle: Text(ayat.tr.toString(),style: const TextStyle(color: Colors.purple)),
                 )
               ],
             ),
             ),
         );
         },
       ),
     );
   }
 }