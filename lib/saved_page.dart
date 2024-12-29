import 'package:flutter/material.dart';
import 'package:newsly/profile_page.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("RIP NEWS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 2),
            Text("Saved", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),

          ],
        ),
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
      body: const Center(
        child: Text('No saved articles yet!'),
      ),
    );
  }
}
