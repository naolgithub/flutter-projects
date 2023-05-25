import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/white_chatgpt_icon.png',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Create your account',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Please note that phone verification is required for',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                const Text(
                  'signup. Your number will only be used to verify',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                const Text(
                  'your identity for security purposes.',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email address',
                      hintStyle: TextStyle(
                        fontSize: 23,
                      ),
                      enabledBorder: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10)
                      .copyWith(bottom: 10),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                      color: const Color.fromARGB(255, 12, 195, 89),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 23,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: Color.fromARGB(255, 12, 195, 89),
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Image(
                  height: 25,
                  width: double.infinity,
                  image: AssetImage(
                    'assets/images/or_icon.png',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            height: 25,
                            width: 25,
                            image: AssetImage('assets/images/or_icon.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Continue with Google',
                            style: TextStyle(fontSize: 23),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            height: 25,
                            width: 25,
                            image: AssetImage('assets/images/or_icon.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Continue with Microsoft Account',
                            style: TextStyle(fontSize: 23),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            height: 25,
                            width: 25,
                            image: AssetImage('assets/images/or_icon.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Continue with Apple',
                            style: TextStyle(fontSize: 23),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
