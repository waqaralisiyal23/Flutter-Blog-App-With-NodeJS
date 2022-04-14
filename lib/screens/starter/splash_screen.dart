import 'package:blogapp/screens/auth/login_screen.dart';
import 'package:blogapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = const FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      selectRoute();
    });
  }

  void selectRoute() async {
    String? token = await storage.read(key: 'token');
    if (token != null) {
      Get.offAll(() => const HomeScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 250.0,
              height: 250.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Blog App',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
