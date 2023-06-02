import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'pallete.dart';
import 'responsive/mobile_screen_layout.dart';
import 'responsive/responsive_screen_layout.dart';
import 'responsive/web_screen_layout.dart';
import 'screens/sign_up_page.dart';
import 'utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: StreamBuilder(
          //persisting user state using firebase authentication methods
          //1.FirebaseAuth.instance.idTokenChanges()
          //This method is called right after user is
          //signed in or whenever the user is signed out
          //or whenever there is id token changes
          //....> if the user signs in with another device the authentication will be back again

          //2.FirebaseAuth.instance.userChanges()
          //This method is called right after user is
          //signed in or whenever the user is signed out
          //we also use this method whenever we want to
          //update our password,email and others

          //3.FirebaseAuth.instance.authStateChanges()
          //this method runs only when the user signed in and signed out

          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('$snapshot.error'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }

            // if snapshot has not any data we return to our LoginScreen page
            //if snapshot has not any data it means the use has not authenticated
            return const SignUpPage();
          }),
    );
  }
}
