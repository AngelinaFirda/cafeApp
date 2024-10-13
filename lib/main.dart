import 'package:flutter/material.dart';
import 'package:wikusama_cafe/views/landing_page.dart';
import 'package:wikusama_cafe/views/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wikusama Cafe',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LandingPage(), // Set the LandingPage as the home
      routes: {
        '/login': (context) => LoginPage(), // Define your login route
      },
    );
  }
}
