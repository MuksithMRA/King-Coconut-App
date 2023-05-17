// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kingcoconut/constants/app_colors.dart';
import 'package:kingcoconut/controllers/chat_controller.dart';
import 'package:kingcoconut/models/chat.dart';

class ChatDetailScreen extends StatelessWidget {
  final bool type;
  ChatController chatController = Get.put(ChatController());
  ChatDetailScreen({
    Key? key,
    this.type = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(chatController.chatData.chatList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const Border(
            bottom: BorderSide(color: AppColors.appColorBlack, width: 0.5)),

        centerTitle: true,
        title: Center(
          child: Image.asset(
            "assets/images/kingcoco.png",
            width: 250,
            height: 85,
          ),
        ),
        // leading:  Container(
        //     alignment: Alignment.center,
        //     child: FilledCustomButton(
        //         text: 'Proceed and continue',
        //         bgColor: AppColors.appColorprimary,
        //         clickEvent: () {
        //           // if(_isValidate()){
        //           // }
        //         })),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.appColorBlack,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SizedBox(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      // chatController.chatData.chatList == null ?
                      // Column() :
                      Obx(() {
                    return Column(
                      children: chatController.chatData.chatList!.isEmpty
                          ? []
                          : chatController.chatData.chatList!
                              .map((chat) => BubbleSpecialThree(
                                    text: chat.message!,
                                    color: chat.owner == true
                                        ? const Color(0xFF1B97F3)
                                        : const Color(0xFFE8E8EE),
                                    tail: true,
                                    isSender: chat.owner == true ? true : false,
                                    textStyle: const TextStyle(fontSize: 14),
                                  ))
                              .toList(),
                    );
                    //   Column(
                    //   children: chatController.chatData.chatList == null
                    //       ? []
                    //       : chatController.chatData.chatList!
                    //       .map((chat) => BubbleSpecialThree(
                    //     text: chat.message!,
                    //     color: chat.owner == true ? const Color(0xFF1B97F3) :  const Color(0xFFE8E8EE),
                    //     tail: true,
                    //     isSender: chat.owner == true ? true : false,
                    //     textStyle: const TextStyle(fontSize: 14),
                    //   ))
                    //       .toList(),
                    // );
                  })
                  // Column(
                  //   children: <Widget>[
                  //     BubbleNormal(
                  //       text: '  ',
                  //       isSender: true,
                  //       color: const Color(0xFFE8E8EE),
                  //       tail: true,
                  //       sent: true,
                  //     ),
                  //
                  //   ],
                  // ),
                  ),
            ),
            MessageBar(
              onSend: (text) {
                var chat = Data(message: text, owner: type);
                chatController.chatData.chatList?.add(chat);
                chatController.sendMessage(message: text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
