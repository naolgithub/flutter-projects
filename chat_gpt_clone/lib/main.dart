import 'package:flutter/material.dart';

import 'pallete.dart';
import 'sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatGPT Clone',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.whiteColor,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Cera Pro'),
          bodyMedium: TextStyle(fontFamily: 'Cera Pro'),
          bodySmall: TextStyle(fontFamily: 'Cera Pro'),
        ),
      ),
      home: const SignUpPage(),
    );
  }
}
