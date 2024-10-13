import 'package:flutter/material.dart';
import 'package:wikusama_cafe/views/login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8E3200),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 2),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Welcome to our cozy cafe! We’re thrilled to have you here. Explore our delicious menu and find your perfect brew. Enjoy your visit!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  Image.asset('logo/coffee_logo.png'),
                  SizedBox(height: 20),
                  Container(
                    width: screenWidth - 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        textStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        backgroundColor: Color(0xff8E3200),
                        foregroundColor: Color(0xffFDF8EB),
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
