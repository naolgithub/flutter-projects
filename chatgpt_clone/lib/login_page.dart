import 'package:chatgpt_clone/pallete.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.blackColor,
      appBar: AppBar(
        backgroundColor: Pallete.blackColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/black_chatgpt_icon.png'),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Welcome to ChatGPT',
              style: TextStyle(
                color: Pallete.whiteColor,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Log in with your OpenAI account to continue',
              style: TextStyle(
                color: Pallete.whiteColor,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  textColor: Pallete.whiteColor,
                  color: Colors.green,
                  onPressed: () {},
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  textColor: Pallete.whiteColor,
                  color: Colors.green,
                  onPressed: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
