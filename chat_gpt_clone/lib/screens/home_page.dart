import 'package:flutter/material.dart';

import '../openai_service.dart';
import '../pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textEditingController = TextEditingController();
  String textFromTextEditingController = '';
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  String? generatedImageUrl;

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
            top: 30,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Pallete.borderColor,
            ),
            borderRadius: BorderRadius.circular(20).copyWith(
              topLeft: Radius.zero,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              generatedContent == null
                  ? 'Good Morning, what task can I do for you?'
                  : generatedContent!,
              style: TextStyle(
                fontFamily: 'Cera Pro',
                color: Pallete.mainFontColor,
                fontSize: generatedContent == null ? 25 : 18,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await openAIService.chatGPTAPI(textFromTextEditingController);
        },
      ),
    );
  }
}
