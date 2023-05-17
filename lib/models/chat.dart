import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ChatData {
  // List<Data>? data;
  RxList<Data>? chatList;
  String? message;

  ChatData({this.chatList, this.message});

  ChatData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      chatList = <Data>[].obs;
      json['data'].forEach((v) {
        chatList!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }
  // ChatData.fromJson(Map<String, dynamic> json) {
  //   if (json['data'] != null) {
  //     List<dynamic> data = json['data'];
  //     chatList = RxList<Data>(data.map((v) => Data.fromJson(v)).toList());
  //   }
  //   message = json['message'];
  // }


  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   data['message'] = this.message;
  //   return data;
  // }
}

class Data {
  String? message;
  bool? owner;

  Data({this.message, this.owner});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    owner = json['owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['owner'] = this.owner;
    return data;
  }
}
