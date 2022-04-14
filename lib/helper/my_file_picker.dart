import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MyFilePicker {
  static Future<File?> pickImage(ImageSource imageSource) async {
    ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: imageSource);
    return pickedImage == null ? null : File(pickedImage.path);
  }
}
