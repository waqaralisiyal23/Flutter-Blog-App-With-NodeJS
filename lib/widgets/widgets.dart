import 'package:blogapp/enums/snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget circularProgress({Color color = const Color(0xff00A86B)}) {
  return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color));
}

void showSnackbar(SnackbarMessage messageType, String msg,
    {Color textolor = Colors.white}) {
  Get.snackbar(
    messageType == SnackbarMessage.error
        ? 'Error'
        : messageType == SnackbarMessage.success
            ? 'Success'
            : 'Missing',
    msg,
    backgroundColor: messageType == SnackbarMessage.error
        ? Colors.red
        : messageType == SnackbarMessage.success
            ? Colors.green
            : Colors.orangeAccent,
    colorText: textolor,
  );
}
