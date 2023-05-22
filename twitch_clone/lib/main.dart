import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/firebase_options.dart';
import 'package:twitch_clone/providers/user_provider.dart';
import 'package:twitch_clone/resources/auth_methods.dart';
import 'package:twitch_clone/screens/home_screen.dart';
import 'package:twitch_clone/screens/login_screen.dart';
import 'package:twitch_clone/screens/signup_screen.dart';
import 'package:twitch_clone/utils/colors.dart';
import 'package:twitch_clone/widgets/loading_indicator.dart';

import 'models/user.dart' as model;
import 'screens/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitch Clone',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: backgroundColor,
          // titleTextStyle: const TextStyle(
          //   color: primaryColor,
          //   fontSize: 20,
          //   fontWeight: FontWeight.w600,
          //   fontStyle: FontStyle.italic,
          // ),
          titleTextStyle: GoogleFonts.satisfy(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
          iconTheme: const IconThemeData(
            color: primaryColor,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          iconColor: Colors.white,
          outlineBorder: BorderSide(
            width: 2,
            style: BorderStyle.solid,
            color: Colors.black,
          ),
        ),
        // platform: TargetPlatform.macOS,
        // primaryTextTheme: const TextTheme(
        //   displayLarge: TextStyle(
        //     fontSize: 20,
        //     fontStyle: FontStyle.italic,
        //     fontWeight: FontWeight.bold,
        //   ),
        //   displayMedium: TextStyle(
        //     fontSize: 20,
        //     fontStyle: FontStyle.italic,
        //     fontWeight: FontWeight.bold,
        //   ),
        //   displaySmall: TextStyle(
        //     fontSize: 20,
        //     fontStyle: FontStyle.italic,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        primaryTextTheme: GoogleFonts.satisfyTextTheme(
          const TextTheme(
            // bodyLarge: TextStyle(
            //   fontSize: 25,
            //   fontStyle: FontStyle.italic,
            //   fontWeight: FontWeight.bold,
            // ),
            bodyMedium: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            // bodySmall: TextStyle(
            //   fontSize: 25,
            //   fontStyle: FontStyle.italic,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
        ),
      ),
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      home: FutureBuilder(
        future: AuthMethods()
            .getCurrentUser(FirebaseAuth.instance.currentUser != null
                ? FirebaseAuth.instance.currentUser!.uid
                : null)
            .then((value) {
          //If the returned currentUser Id is not null
          //store it to the provider
          if (value != null) {
            Provider.of<UserProvider>(context, listen: false).setUser(
              model.User.fromMap(value),
            );
          }
          return value;
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const OnboardingScreen();
        },
      ),
    );
  }
}
