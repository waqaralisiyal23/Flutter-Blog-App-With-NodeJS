import 'package:blogapp/screens/home/controllers/home_controller.dart';
import 'package:blogapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeDrawer extends GetView<HomeController> {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Obx(
              () => controller.drawerLoading.value
                  ? Center(child: circularProgress())
                  : Column(
                      children: <Widget>[
                        Obx(() => controller.drawerProfile.value),
                        const SizedBox(height: 10),
                        Obx(
                          () => Text('@${controller.username.value}'),
                        ),
                      ],
                    ),
            ),
          ),
          ListTile(
            title: const Text('All Post'),
            trailing: const Icon(Icons.launch),
            onTap: () {},
          ),
          ListTile(
            title: const Text('New Story'),
            trailing: const Icon(Icons.add),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Settings'),
            trailing: const Icon(Icons.settings),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Feedback'),
            trailing: const Icon(Icons.feedback),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Logout'),
            trailing: const Icon(Icons.power_settings_new),
            onTap: () => controller.logout(),
          ),
        ],
      ),
    );
  }
}
