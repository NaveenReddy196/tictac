import 'package:flutter/material.dart';
import 'package:tictoc/features/authentication/views/plashscreen.dart';
//import 'package:tictoc/features/pages/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        fontFamily: "poppins"
      
      ),
      home: FlashScreen()
    );
  }
}
