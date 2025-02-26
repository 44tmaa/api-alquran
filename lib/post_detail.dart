import 'package:flutter/material.dart';
import 'post_model.dart';

String cleanHtmlTags(String htmlString) {
  return htmlString.replaceAll(RegExp(r'<[^>]*>'), '');
}
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
         title: const Text("Dibaca yang bener ya curig-curig kuhh",style: TextStyle(color: const Color.fromARGB(255, 245, 123, 209))),
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
                   leading: CircleAvatar(backgroundColor: const Color.fromARGB(255, 245, 123, 209),
                   child: Text(ayat.nomor.toString(),
                   style: TextStyle(
                     color: Colors.white
                   ),
                   ),
                   ),
                 ),
                 ListTile(
                  
                   title: const Text("Ayat", style: TextStyle(color: const Color.fromARGB(255, 245, 123, 209)),textAlign: TextAlign.end,),
                   subtitle: Text(ayat.ar.toString(),
                   style: const TextStyle( fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 245, 123, 209)),
                   textAlign: TextAlign.end,
                   ),
                 ),
                 ListTile(
                   title: const Text("Latin", style: TextStyle(color: const Color.fromARGB(255, 245, 123, 209)),textAlign: TextAlign.end,),
                   subtitle: Text(cleanHtmlTags(ayat.tr.toString()),
                   style: const TextStyle(color: const Color.fromARGB(255, 245, 123, 209)),
                    textAlign: TextAlign.end,
                   ),
                 ),
                 ListTile(
                   title: const Text("Terjemahan", style: TextStyle(color: const Color.fromARGB(255, 245, 123, 209)),textAlign: TextAlign.end,),
                   subtitle: Text(ayat.idn.toString(),
                   style: const TextStyle(color: const Color.fromARGB(255, 245, 123, 209)),
                   textAlign: TextAlign.end,
                   ),
                   
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