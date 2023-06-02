import 'package:chatgpt_using_openai_api/constants/constants.dart';
import 'package:chatgpt_using_openai_api/services/assets_manager.dart';
import 'package:chatgpt_using_openai_api/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String msg;
  final int chatIndex;
  const ChatWidget({
    super.key,
    required this.msg,
    required this.chatIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userName
                      : AssetsManager.botImage,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(child: TextWidget(label: msg)),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
