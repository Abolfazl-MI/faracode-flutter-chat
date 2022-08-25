import 'package:faracode_flutter_chat/Models/message_model.dart';
import 'package:faracode_flutter_chat/Models/users.dart';
import 'package:flutter/material.dart';


import '../../components/components.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel? message;
  final User? user;
  const ChatBubble({
    Key? key,
    required this.message,
    required this.user,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    List<Widget> chatContents = [
      if (!message!.isMine)
        CircleAvatar(
          child: user == null
              ? preloader
              : Text(user!.lastname.substring(0, 2)),
        ),
      const SizedBox(width: 12),
      Flexible(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: message!.isMine
                ? Theme.of(context).primaryColor
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(message!.content),
        ),
      ),
      const SizedBox(width: 12),
      Text(message!.createdAt.toString()),
      const SizedBox(width: 60),
    ];
    if (message!.isMine) {
      chatContents = chatContents.reversed.toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Row(
        mainAxisAlignment:
            message!.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: chatContents,
      ),
    );
  }
}