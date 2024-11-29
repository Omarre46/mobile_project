import 'package:flutter/material.dart';
import 'home.dart';
//Done by
// Omar Al Zoghbi 12132034
//Hamza Abo Saado 12132554
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "Area Calculator",


      home:  Home()
    );
  }
}
