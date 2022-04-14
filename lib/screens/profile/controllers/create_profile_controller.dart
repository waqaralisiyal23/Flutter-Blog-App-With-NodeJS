import 'dart:convert';
import 'dart:io';

import 'package:blogapp/enums/snackbar_message.dart';
import 'package:blogapp/helper/my_file_picker.dart';
import 'package:blogapp/screens/home/home_screen.dart';
import 'package:blogapp/services/http_service.dart';
import 'package:blogapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CreateProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController professionController;
  late TextEditingController dobController;
  late TextEditingController titleController;
  late TextEditingController aboutController;

  RxBool loading = false.obs;
  Rx<File?> imageFile = Rx<File?>(null);

  final HttpService httpService = HttpService();

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    professionController = TextEditingController();
    dobController = TextEditingController();
    titleController = TextEditingController();
    aboutController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    professionController.dispose();
    dobController.dispose();
    titleController.dispose();
    aboutController.dispose();
    super.onClose();
  }

  void saveProfile() async {
    if (formKey.currentState!.validate()) {
      if (imageFile.value != null) {
        try {
          loading(true);
          Map<String, String> data = {
            'name': nameController.text.trim(),
            'profession': professionController.text.trim(),
            'DOB': dobController.text.trim(),
            'titleline': titleController.text.trim(),
            'about': aboutController.text.trim(),
          };
          http.Response response = await httpService.post('/profile/add', data);
          var jsonData = json.decode(response.body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            uploadImage();
          } else if (response.statusCode == 400) {
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
      } else {
        showSnackbar(
            SnackbarMessage.missing, 'Please upload your profile image');
      }
    }
  }

  void uploadImage() async {
    http.StreamedResponse response = await httpService.patchImage(
        '/profile/add/image', imageFile.value!.path);
    if (response.statusCode == 200 || response.statusCode == 201) {
      loading(false);
      Get.offAll(() => const HomeScreen());
      showSnackbar(SnackbarMessage.success, 'Profile Updated Successfully');
    } else if (response.statusCode == 500) {
      loading(false);
      showSnackbar(SnackbarMessage.error, 'Something Went Wrong!');
    } else {
      loading(false);
      showSnackbar(SnackbarMessage.error, 'Unknown Error Occured');
    }
  }

  void pickImage(ImageSource imageSource) async {
    File? pickedFile = await MyFilePicker.pickImage(imageSource);
    Get.back();
    if (pickedFile != null) {
      imageFile(pickedFile);
    }
  }
}
