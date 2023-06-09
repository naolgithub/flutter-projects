// ignore_for_file: public_member_api_docs, sort_constructors_first

class ChatModel {
  final String msg;
  final int chatIndex;
  ChatModel({
    required this.msg,
    required this.chatIndex,
  });

  factory ChatModel.fromMap(Map<String, dynamic> json) {
    return ChatModel(
      msg: json['msg'],
      chatIndex: json['chatIndex'],
    );
  }
}
