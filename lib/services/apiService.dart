import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  static String API_BASE_URL = "ec2-13-229-183-94.ap-southeast-1.compute.amazonaws.com:5001";

  Future<http.Response> getMvf({
    required String token,
  }) async {
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.https("/api/cms/publish-book");
    return await http.get(url, headers: header);
  }


  Future<http.Response> userlogin({
    required String username,
    required String password,

  }) async {
    print(username);
    print(password);
    var data = {
      'username': username,
      'password': password,

    };
    var jsonBody = jsonEncode(data);
    var header = {
      "Content-Type":"application/json",
      "Content-Length": jsonBody.length.toString(),
    };
print("1");
    var url = Uri.http("coco.southcentralus.cloudapp.azure.com:5000","/login");
    print("2");
    return await http.post(url, body: jsonBody, headers: header);

  }

  Future<http.Response> userSignup({
    required String username,
    required String email,
    required String password,
    required String number,

  }) async {
    print(username);
    print(password);
    var data = {
      'username': username,
      "email": email,
      "number": number,
      'password': password,

    };
    var jsonBody = jsonEncode(data);
    var header = {
      "Content-Type":"application/json",
      "Content-Length": jsonBody.length.toString(),
    };
    print("1");
    var url = Uri.http("coco.southcentralus.cloudapp.azure.com:5000","/register");
    print("2");
    return await http.post(url, body: jsonBody, headers: header);

  }

  Future<http.Response> getProfile({
    required String token,

  }) async {
    print(token);
    var header = {
      "Accept": "application/json",
    };
    var url = Uri.http("coco.southcentralus.cloudapp.azure.com:5000","/profile/$token");
    return await http.get(url, headers: header);
  }

  Future<http.Response> deleteProfile({
    required String token,

  }) async {
    print(token);
    var header = {
      "Accept": "application/json",
    };
    var url = Uri.http(API_BASE_URL,"/delete/$token");
    return await http.get(url, headers: header);
  }
  // Future<http.Response> growingDetection({
  //   required File image,
  //   required int age,
  //
  // }) async {
  //   print(image);
  //   var data = {
  //     'image': image,
  //     'password': age,
  //
  //   };
  //   var header = {"Accept": "application/json"};
  //   var url = Uri.https("/api/customer/login");
  //   return await http.post(url, body: data, headers: header);
  // }
  Future<http.Response> diseaseDetection(
      { required String baseImg}) async {
    print("uuuuuuuuuuuu");
    print(baseImg);
    var header = {
      "Accept": "*/*",
      "Connection":"keep-alive",
      "Content-Type": "application/json",
    };
    var data = {'image': baseImg
    };
    var jsonBody = jsonEncode(data);

    header["Content-Length"] = jsonBody.length.toString();
    var url = Uri.http(API_BASE_URL,"/disease_classification");
    print(jsonBody);
    return await http.post(url, headers: header, body: jsonBody);

  }

  Future<http.Response> growingDetection(
      { required String baseImg,required String age}) async {
    print(age);

    var header = {
      "Accept": "*/*",
      "Connection":"keep-alive",
      "Content-Type": "application/json",
      "Accept-Encoding":"gzip, deflate, br"
    };
    var data = {'age':age,'image': baseImg};
    var jsonBody = jsonEncode(data);
    // header["Content-Length"] = jsonBody.length.toString();
    var url = Uri.http(API_BASE_URL,"/growing_detection");
    return await http.post(url, headers: header, body: jsonBody);
  }

  Future<http.Response> sendMessage(
      {
        required String message,
      }) async {
    print(message);
    var header = {
      "Accept": "*/*",
      "Connection":"keep-alive",
      "Content-Type": "application/json",

    };
    var data = {
      'query' : message
    };
    var jsonBody = jsonEncode(data);
    // header["Content-Length"] = jsonBody.length.toString();
    var url = Uri.http(API_BASE_URL, "/chatbot");
    return await http.post(url, headers: header,body: jsonBody);
  }



}