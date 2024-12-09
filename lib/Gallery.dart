import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gallery',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 images per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            // List of manually added images
            buildImageCard('assets/me11.jpg'),
            buildImageCard('assets/me1.jpg'),
            buildImageCard('assets/me2.jpg'),
            buildImageCard('assets/me3.jpg'),
            buildImageCard('assets/me4.jpg'),
            buildImageCard('assets/me5.jpg'),
            buildImageCard('assets/PP.jpg'),
             buildImageCard('assets/PP.jpg'),
          ],
        ),
      ),
    );
  }

  Widget buildImageCard(String imagePath) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
