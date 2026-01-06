import 'package:flutter/material.dart';
import 'pages/splashscreen.dart';

void main() {
  runApp(const SimagangApp());
}

class SimagangApp extends StatelessWidget {
  const SimagangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIMAGANG Dishub',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFF03254C),
        scaffoldBackgroundColor: const Color(0xFFD0EFFF),
      ),
      home: const SplashScreen(),
    );
  }
}
