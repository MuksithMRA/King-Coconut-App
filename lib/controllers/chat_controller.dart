import 'dart:convert';
import 'package:get/get.dart';
import 'package:kingcoconut/models/chat.dart';
import 'package:kingcoconut/services/apiService.dart';

class ChatController extends GetxController {
  ChatData chatData = ChatData();

  Future sendMessage({required String message}) async {
    try {
      var response = await ApiService().sendMessage(message: message);
      // print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        print(decodedData);
        chatData = ChatData.fromJson(decodedData);
      } else {
        // CustomToast.buildToast(
        //   message: "Invalid Response",
        // );
      }
    } catch (e) {
      print("--------------->$e");
    }
  }
}
