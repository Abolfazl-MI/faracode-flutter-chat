import 'package:faracode_flutter_chat/controller/message_controller.dart';
import 'package:faracode_flutter_chat/view/Widgets/widget.dart';
import 'package:faracode_flutter_chat/view/constants/my_colors.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  final messageController = Get.put(MessageController());
  //  late final Stream<List<MessageModel>> _messagesStream;

  // final Map<String, User> _profileCache = {};
  // TODO badan messagestream o tarif konam

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.backGroundColor,
      body: Stack(children: [
        const CustomAppBar(),
        Positioned(
          top: size.height * 0.09,
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height * 1,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: StreamBuilder(
                  stream: messageController.channel!.stream,
                  builder: (context, snapshot) {
                    return Text(snapshot.hasData ? '${snapshot.data}' : '');

                    //  return
                    //     Column(
                    //       children: [
                    //         SizedBox(
                    //           height:200 ,
                    //           child: ListView.builder(
                    //             reverse: true,
                    //             itemBuilder: (context, index) {
                    //               return Text(snapshot.hasData ? '${snapshot.data}' : '');
                    //               return ChatBubble(message: snapshot.data, user: null,);
                    //             },
                    //             ),
                    //         )
                    //       ],
                    //     );
                  }),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MessageTextField(),
          ),
        ),
      ]),
    ));
  }
}
