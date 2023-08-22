import 'package:flutter/material.dart';
import 'package:restapi/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Consuming REST API")),
        body: const SingleChildScrollView(
          child: HomeScreen()
        ),
      ),
    );
  }
}
