import 'package:blogapp/screens/home/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    controller.checkProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEFF),
      body: Obx(() => controller.page.value),
    );
  }
}
