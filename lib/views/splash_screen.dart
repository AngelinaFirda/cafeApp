// import 'package:flutter/material.dart';
// import 'package:wikusama_cafe/views/landing_page.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToHome();
//   }

//   _navigateToHome() async {
//     await Future.delayed(Duration(seconds: 3), () {});
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LandingPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF8E3200),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('logo/cafe_logo.png'),
//           ],
//         ),
//       ),
//     );
//   }
// }
