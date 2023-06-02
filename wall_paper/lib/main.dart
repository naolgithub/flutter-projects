import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wall Paper',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.satisfyTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
