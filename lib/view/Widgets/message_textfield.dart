import 'package:faracode_flutter_chat/controller/message_controller.dart';
import 'package:faracode_flutter_chat/view/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';


class MessageTextField extends StatelessWidget {
 
   MessageTextField(
    {Key? key}) : super(key: key);
     final messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;

    return Container(
              width: size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: MyColors.primaryColor),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (() {}),
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          size: 30,color: MyColors.textColor,
                        )),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Form(
                        child: TextFormField(
                            controller: messageController.textController,
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
                        icon: const Icon(Icons.attach_file_rounded),color: MyColors.textColor),
                    FloatingActionButton(
                      splashColor: MyColors.textColor,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      onPressed: () => messageController.sendMessage(),
                      tooltip: "sendmessage",
                      
                      
                      child: const Icon(Icons.send),
                    ),
                  ]),
            );
  }
}