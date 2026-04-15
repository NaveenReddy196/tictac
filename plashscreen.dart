import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tictoc/features/pages/home.dart';
import 'package:tictoc/constant/image.dart';
import 'package:tictoc/constant/colors.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {

  @override
  void initState() {
    super.initState();

    
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const Home(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.yello,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           
            Image.asset(
              Appimages.screen,
              height: 200,
            ),

            const SizedBox(height: 20),

          
            const Text(
              "Tic Tac Toe",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2, 
              ),
            ),

           
          ],
        ),
      ),
    );
  }
}