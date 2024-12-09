import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:aplikasisaya/main.dart';  // Pastikan path ini benar sesuai dengan struktur folder Anda

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay selama 4 detik untuk menampilkan splash screen, kemudian pindah ke halaman utama (MyApp)
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyApp(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Menambahkan Lottie animation untuk splash screen
        child: Lottie.asset(
          'assets/plane.json', // Pastikan path ini benar sesuai dengan lokasi file Lottie di project Anda
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
