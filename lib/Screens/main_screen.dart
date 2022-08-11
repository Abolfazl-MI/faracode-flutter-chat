import 'dart:developer';

import 'package:faracode_flutter_chat/Components/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();
  final _channel =
      WebSocketChannel.connect(Uri.parse("wss://echo.websocket.events"));
  //TODO : آدرس چنل و از مرتضی بگیرم
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 205, 205),
      body: Stack(children: [
        CustomAppBar(),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),

              StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');})
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (() {}),
                        icon: Icon(
                          Icons.emoji_emotions_outlined,
                          size: 30,
                        )),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Form(
                        child: TextFormField(
                            controller: textEditingController,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 6,
                            decoration: const InputDecoration(
                              
                              hintText: "write your massage",
                              contentPadding: EdgeInsets.only(left: 5),
                            )),
                      ),
                    ),
                    IconButton(
                        onPressed: (() {}),
                        icon: Icon(Icons.attach_file_rounded)),
                    FloatingActionButton(
                      backgroundColor: Colors.transparent,elevation: 0,
                   onPressed: _sendMessage,tooltip: "sendmessage",child: Icon(Icons.send),),
                  ]),
            ),
          ),
        ),
  
      ]),
    ));
  }

  void _sendMessage() {
    if (textEditingController.text.isNotEmpty) {
      _channel.sink.add(textEditingController.text);
      
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    textEditingController.dispose();
  }
}
