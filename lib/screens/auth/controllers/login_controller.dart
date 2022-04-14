import 'dart:convert';

import 'package:blogapp/enums/snackbar_message.dart';
import 'package:blogapp/screens/home/home_screen.dart';
import 'package:blogapp/services/http_service.dart';
import 'package:blogapp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  RxBool obscureText = true.obs;
  RxBool loading = false.obs;

  final HttpService httpService = HttpService();
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      try {
        loading(true);
        Map<String, String> data = {
          'username': usernameController.text.trim(),
          'password': passwordController.text,
        };
        http.Response response = await httpService.post('/user/login', data);
        var jsonData = json.decode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          await storage.write(key: 'token', value: jsonData['token']);
          loading(false);
          Get.offAll(() => const HomeScreen());
        } else if (response.statusCode == 403 || response.statusCode == 500) {
          loading(false);
          showSnackbar(SnackbarMessage.error, jsonData['msg']);
        } else {
          loading(false);
          showSnackbar(SnackbarMessage.error, 'Unknown Error Occured');
        }
      } catch (e) {
        loading(false);
        showSnackbar(SnackbarMessage.error, e.toString());
      }
    }
  }
}
