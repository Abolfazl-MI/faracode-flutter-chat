
import 'package:faracode_flutter_chat/controller/message_controller.dart';
import 'package:faracode_flutter_chat/view/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      init: MessageController(),
      builder: (GetxController controller) {
        return ChatScreen();
      },
    );
  }
}
