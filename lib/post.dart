import 'package:flutter/material.dart';
import 'http_service.dart';
import 'post_model.dart';
import 'post_detail.dart'; // Pastikan ada file post_detail.dart

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  PostsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: FutureBuilder<List<Surah>>(
        future: httpService.getSurah(),
        builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading indicator saat data belum tersedia
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Menampilkan error jika ada masalah saat mengambil data
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Surah> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Surah post = posts[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar (
                      backgroundColor: const Color.fromARGB(255, 245, 123, 209),
                      child: Text (
                        post.nomor.toString(),
                      ),
                    ),
                    title: Text(
                      post.nama_latin,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text("Arti: ${post.arti}"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async{
                      // final surahDetail =
                      // await httpService.getSurahDetail(post.nomor);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => PostDetail(
                      //       surahDetail: surahDetail,
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                );
              },
            );
          } else {
            // Pesan jika data kosong
            return const Center(child: Text("No data available."));
          }
        },
      ),
    );
  }
}
