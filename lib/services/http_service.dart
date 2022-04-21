import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class HttpService {
  String baseUrl =
      'http://xxx.xxx.x.x:3000'; // IP Address of Current Connected Wifi

  final storage = const FlutterSecureStorage();

  Future<http.Response> get(String url) async {
    String? token = await storage.read(key: 'token');
    url = formater(url);
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );
    return response;
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    String? token = await storage.read(key: 'token');
    url = formater(url);
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> patch(String url, Map<String, String> body) async {
    String? token = await storage.read(key: 'token');
    url = formater(url);
    http.Response response = await http.patch(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.StreamedResponse> patchImage(String url, String filepath) async {
    String? token = await storage.read(key: 'token');
    url = formater(url);

    http.MultipartRequest request =
        http.MultipartRequest('PATCH', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('img', filepath));
    request.headers.addAll({
      'Content-type': 'multipart/form-data',
      'Authorization': 'Bearer $token'
    });
    http.StreamedResponse response = await request.send();
    return response;
  }

  NetworkImage getImage(String imageName) {
    String url = formater('/uploads//$imageName.jpg');
    return NetworkImage(url);
  }

  String formater(String url) {
    return baseUrl + url;
  }
}
