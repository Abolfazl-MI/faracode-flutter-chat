import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageController extends GetxController{
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  late final WebSocketChannel? channel;
  TextEditingController? textController= TextEditingController();
  

  void sendMessage() {
    if (textController!.text.isNotEmpty) {
      channel!.sink.add(textController!.text);
      }
    }

  @override
  void onInit() {
    super.onInit();
   channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
    
  );
    
  }
  


  @override
  void dispose() {
    
    channel!.sink.close();
    super.dispose();
  }
  
}