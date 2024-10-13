import 'package:flutter/material.dart';

class ManagerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manager Home'),
      ),
      body: Center(
        child: Text('Welcome, Manager!'),
      ),
    );
  }
}
