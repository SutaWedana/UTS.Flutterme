import 'package:flutter/material.dart';

class HobbyImagesPage extends StatelessWidget {
  final String hobby;

  const HobbyImagesPage({super.key, required this.hobby});

  @override
  Widget build(BuildContext context) {
    // Menentukan daftar gambar berdasarkan hobi dengan deskripsi kamera atau alat desain
    final List<Map<String, String>> images = hobby == 'Photography'
        ? [
            {
              'image': 'assets/1.jpg',
              'description': 'Canon 600D'
            },
            {
              'image': 'assets/3.jpg',
              'description': 'Canon 600D'
            },
            {
              'image': 'assets/4.jpg',
              'description': 'Canon 600D'
            },
            {
              'image': 'assets/5.jpg',
              'description': 'Canon 600D'
            },
            {
              'image': 'assets/6.jpg',
              'description': 'Canon 600D'
            },
            {
              'image': 'assets/7.jpg',
              'description': 'Canon 600D'
            },
            {
              'image': 'assets/8.jpg',
              'description': 'Canon 600D'
            },
            {
              'image': 'assets/9.jpg',
              'description': 'Canon 600D'
            },
          ]
        : [
            {
              'image': 'assets/11.jpg',
              'description': 'Lightroom'
            },
            {
              'image': 'assets/22.jpg',
              'description': 'Lightroom'
            },
            {
              'image': 'assets/33.jpg',
              'description': 'Lightroom'
            },
            {
              'image': 'assets/44.jpg',
              'description': 'Lightroom'
            },
            {
              'image': 'assets/BG.jpg',
              'description': 'CorelDraw'
            },
            {
              'image': 'assets/BG.jpg',
              'description': 'CorelDraw'
            },
            {
              'image': 'assets/BG.jpg',
              'description': 'CorelDraw'
            },
            {
              'image': 'assets/BG.jpg',
              'description': 'CorelDraw'
            },
          ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          hobby == 'Photography' ? 'Halaman Photografi' : 'Halaman Editing',
          style: const TextStyle(color: Colors.white), // White text color
        ),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 gambar per baris
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Smooth border radius
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image display with consistent size
                  Expanded(
                    child: Image.asset(
                      images[index]['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity, // Full width of the card
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Camera/Design Description
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      images[index]['description']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
