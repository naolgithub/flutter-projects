import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'pallete.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int start = 200;
  int delay = 200;
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
            BounceInDown(
              delay: Duration(milliseconds: start),
              child: Image.asset('assets/images/black_chatgpt_icon.png'),
            ),
            const SizedBox(
              height: 15,
            ),
            SlideInLeft(
              delay: Duration(milliseconds: start + delay),
              child: const Text(
                'Welcome to ChatGPT',
                style: TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SlideInLeft(
              delay: Duration(milliseconds: start + 2 * delay),
              child: const Text(
                'Log in with your OpenAI account to continue',
                style: TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FadeInRight(
              delay: Duration(milliseconds: start + 3 * delay),
              child: Row(
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
