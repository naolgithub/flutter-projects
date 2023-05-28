import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fullstack_instagram_clone/firebase_options.dart';
import 'package:fullstack_instagram_clone/providers/user_provider.dart';
import 'package:fullstack_instagram_clone/screens/login_screen.dart';
import 'package:fullstack_instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';

import 'responsive/mobile_screen_layout.dart';
import 'responsive/responsive_layout_screen.dart';
import 'responsive/web_screen_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
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
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
