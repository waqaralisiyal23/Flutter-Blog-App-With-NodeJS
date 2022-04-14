import 'dart:convert';

import 'package:blogapp/enums/snackbar_message.dart';
import 'package:blogapp/models/blog_list_model.dart';
import 'package:blogapp/models/blog_model.dart';
import 'package:blogapp/services/http_service.dart';
import 'package:blogapp/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BlogListController extends GetxController {
  final HttpService httpService = HttpService();
  Rx<List<BlogModel>?> blogList = Rx<List<BlogModel>?>(null);

  void fetchData(String url) async {
    try {
      http.Response response = await httpService.get(url);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BlogListModel blogListModel = BlogListModel.fromJson(jsonData);
        blogList(blogListModel.data);
      } else if (response.statusCode == 500) {
        showSnackbar(SnackbarMessage.error, jsonData['msg']);
      } else {
        showSnackbar(SnackbarMessage.error, 'Unknown Error Occurred');
      }
    } catch (e) {
      showSnackbar(SnackbarMessage.error, e.toString());
    }
  }
}
