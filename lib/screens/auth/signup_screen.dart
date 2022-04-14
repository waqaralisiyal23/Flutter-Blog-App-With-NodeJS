import 'package:blogapp/screens/auth/components/auth_button.dart';
import 'package:blogapp/screens/auth/components/auth_field.dart';
import 'package:blogapp/screens/auth/components/password_field.dart';
import 'package:blogapp/screens/auth/controllers/signup_controller.dart';
import 'package:blogapp/screens/auth/login_screen.dart';
import 'package:blogapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AuthField(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      iconData: Icons.person,
                      controller: controller.usernameController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Username can\'t be empty';
                        }
                        if (value.contains(' ')) {
                          return 'Username can\'t contain spaces';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    AuthField(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      iconData: Icons.email,
                      controller: controller.emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email can\'t be empty';
                        }
                        if (!GetUtils.isEmail(value.trim())) {
                          return 'Email is Invalid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () => PasswordField(
                        controller: controller.passwordController,
                        onEyePressed: () {
                          controller.obscureText(!controller.obscureText.value);
                        },
                        obscureText: controller.obscureText.value,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can\'t be empty';
                          }
                          if (value.length < 8) {
                            return 'Password lenght must be >=8';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => controller.loading.value
                          ? circularProgress()
                          : AuthButton(
                              text: 'Sign Up',
                              onPressed: () => controller.signup(),
                            ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.off(const LoginScreen());
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
