import 'package:blogapp/screens/home/controllers/profile_controller.dart';
import 'package:blogapp/services/http_service.dart';
import 'package:blogapp/widgets/blogs_list.dart';
import 'package:blogapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  final controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
            color: Colors.black,
          ),
        ],
      ),
      body: Obx(
        () => controller.profileModel.value == null
            ? Center(child: circularProgress())
            : ListView(
                children: [
                  head(),
                  const Divider(thickness: 0.8),
                  otherDetails('About', controller.profileModel.value!.about),
                  otherDetails('Name', controller.profileModel.value!.name),
                  otherDetails(
                      'Profession', controller.profileModel.value!.profession),
                  otherDetails('DOB', controller.profileModel.value!.dob),
                  const Divider(thickness: 0.8),
                  const SizedBox(height: 20),
                  const BlogsList(url: '/blogpost/getOwnBlogs'),
                ],
              ),
      ),
    );
  }

  Widget head() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: HttpService()
                  .getImage(controller.profileModel.value!.username),
            ),
          ),
          Text(
            '@${controller.profileModel.value!.username}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(controller.profileModel.value!.titleline),
        ],
      ),
    );
  }

  Widget otherDetails(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
