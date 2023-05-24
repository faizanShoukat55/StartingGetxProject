import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mo_lines/module/dashboard/controller/dashboard_controller.dart';
import 'package:mo_lines/module/main_drawer/widgets/drawer_link_widget.dart';

import '../../../routes/app_routes.dart';


class MainDrawerWidget extends GetView<DashboardController> {
  const MainDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 40,),
          DrawerLinkWidget(
            icon: Icons.numbers,
            text: "Numbers",
            onTap: (e) async {
              Get.back();
              await controller.changePage(0);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.sms,
            text: "SMS",
            onTap: (e) async {
              //Get.offAndToNamed(Routes.CATEGORIES);
              Get.back();
              await controller.changePage(1);
            },
          ),


          DrawerLinkWidget(
            icon: Icons.calendar_month,
            text: "Plans",
            onTap: (e) async {
              Get.back();
              await controller.changePage(2);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.settings,
            text: "Settings",
            onTap: (e) async {
              Get.back();
              await controller.changePage(3);
            },
          ),

          const Divider(height: 1,color: Colors.black54,),

          DrawerLinkWidget(
            icon: Icons.help_outline,
            text: "Help & FAQ",
            onTap: (e) async {
              await Get.offAndToNamed(Routes.helpPage);
            },
          ),

        ],
      ),
    );
  }
}