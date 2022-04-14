import 'dart:convert';

import 'package:blogapp/enums/snackbar_message.dart';
import 'package:blogapp/screens/auth/login_screen.dart';
import 'package:blogapp/screens/home/pages/home.dart';
import 'package:blogapp/screens/home/pages/profile.dart';
import 'package:blogapp/services/http_service.dart';
import 'package:blogapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<String> titleString = ['Home Page', 'Profile Page'];
  List<Widget> widgets = [const Home(), const Profile()];
  RxInt currentIndex = 0.obs;
  RxBool drawerLoading = false.obs;
  RxString username = ''.obs;
  Rx<Widget> drawerProfile = Rx<Widget>(const CircleAvatar(
    radius: 50.0,
    backgroundImage: AssetImage('assets/images/profile.png'),
  ));

  final storage = const FlutterSecureStorage();
  final HttpService httpService = HttpService();

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  void fetchUserData() async {
    try {
      drawerLoading(true);
      http.Response response = await httpService.get('/profile/checkprofile');
      var data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        bool hasProfile = data['status'];
        username(data['username']);
        if (hasProfile) {
          drawerProfile(CircleAvatar(
            radius: 50.0,
            backgroundImage: HttpService().getImage(username.value),
          ));
        }
        drawerLoading(false);
      } else if (response.statusCode == 500) {
        drawerLoading(false);
        showSnackbar(SnackbarMessage.error, data['msg']);
      } else {
        drawerLoading(false);
        showSnackbar(SnackbarMessage.error, 'Unknown Error Occured');
      }
    } catch (e) {
      drawerLoading(false);
      showSnackbar(SnackbarMessage.error, e.toString());
    }
  }

  void logout() async {
    await storage.delete(key: 'token');
    Get.offAll(() => const LoginScreen());
  }
}
