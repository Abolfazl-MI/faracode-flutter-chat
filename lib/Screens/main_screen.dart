import 'package:faracode_flutter_chat/Screens/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/message_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
 
  
 
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MessageController(),
      builder: (GetxController controller){
        return ChatScreen();
      },
    );
  }
}