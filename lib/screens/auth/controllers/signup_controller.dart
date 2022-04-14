import 'dart:convert';

import 'package:blogapp/enums/snackbar_message.dart';
import 'package:blogapp/screens/home/home_screen.dart';
import 'package:blogapp/services/http_service.dart';
import 'package:blogapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  RxBool obscureText = true.obs;
  RxBool loading = false.obs;

  final HttpService httpService = HttpService();
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signup() async {
    if (formKey.currentState!.validate()) {
      try {
        loading(true);
        Map<String, String> data = {
          'username': usernameController.text.trim(),
          'email': emailController.text.trim(),
          'password': passwordController.text,
        };
        bool? isExists = await isUserExists();
        if (isExists != null) {
          if (!isExists) {
            http.Response response =
                await httpService.post('/user/register', data);
            var jsonData = json.decode(response.body);
            if (response.statusCode == 200 || response.statusCode == 201) {
              await storage.write(key: 'token', value: jsonData['token']);
              loading(false);
              Get.offAll(() => const HomeScreen());
            } else if (response.statusCode == 403) {
              loading(false);
              showSnackbar(SnackbarMessage.error, jsonData['msg']);
            } else {
              loading(false);
              showSnackbar(SnackbarMessage.error, 'Unknown Error Occured');
            }
          } else {
            loading(false);
            showSnackbar(SnackbarMessage.error, 'Username already exists');
          }
        } else {
          loading(false);
          showSnackbar(SnackbarMessage.error, 'Something Went Wrong');
        }
      } catch (e) {
        loading(false);
        showSnackbar(SnackbarMessage.error, e.toString());
      }
    }
  }

  Future<bool?> isUserExists() async {
    http.Response response = await httpService
        .get('/user/checkusername/${usernameController.text.trim()}');
    var data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      bool isExists = data['status'];
      return isExists;
    } else if (response.statusCode == 500) {
      showSnackbar(SnackbarMessage.error, data['msg']);
      return null;
    } else {
      showSnackbar(SnackbarMessage.error, 'Unknown Error Occured');
      return null;
    }
  }
}
