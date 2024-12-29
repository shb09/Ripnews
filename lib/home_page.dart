import 'package:flutter/material.dart';
import 'package:newsly/profile_page.dart';
import 'package:newsly/detail_page.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> articles = [];

  // Method to fetch JSON data
  Future<void> loadArticles() async {
    final jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/data.json'); // Corrected path from 'asserts' to 'assets'
    final data = json.decode(jsonString);
    setState(() {
      articles = data['articles'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RIP NEWS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: true,
        leading: const Icon(Icons.article_rounded),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_2_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(thickness: 1), // Optional: You can keep or remove this divider
          Expanded(child: _buildArticleList()),
        ],
      ),
    );
  }

  Widget _buildArticleList() {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          elevation: 5,
          child: ListTile(
            contentPadding: const EdgeInsets.all(5.0),
            title: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(article['urlToImage'], fit: BoxFit.cover, height: 200, width: double.infinity),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(4)), // Changed opacity to 0.6 for visibility
                    child: Text(article['source']['name'], style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.only(top: 8.0), child: Text(article['title'], style: const TextStyle(fontWeight: FontWeight.bold))),
                const Divider(),
                Text(article['author'], style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 2),
                Text(article['publishedAt'], style: const TextStyle(fontSize: 12)),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(article: article)));
            },
          ),
        );
      },
    );
  }
}