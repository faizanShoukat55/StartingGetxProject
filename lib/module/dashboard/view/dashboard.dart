import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mo_lines/module/dashboard/controller/dashboard_controller.dart';

import '../../main_drawer/view/main_drawer.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class Dashboard extends GetView<DashboardController>{
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Obx(() {
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: context.theme.colorScheme.secondary,
              size: 20,
            ),
            onPressed: () => {scaffoldKey.currentState!.openDrawer()},
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        drawer: const Drawer(
          elevation: 0,
          child: MainDrawerWidget(),
        ),
        body: controller.currentPage,
        bottomNavigationBar: CustomBottomNavigationBar(
          backGroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.colorScheme.secondary,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePage(index);
          },
          children: [
            CustomBottomNavigationItem(
              icon: Icons.numbers,
              label: "Numbers",
            ),
            CustomBottomNavigationItem(
              icon: Icons.sms,
              label: "SMS",
            ),
            CustomBottomNavigationItem(
              icon: Icons.calendar_month,
              label: "Plans",
            ),
            CustomBottomNavigationItem(
              icon: Icons.settings,
              label: "Settings",
            ),

          ],
        ),
      );
    });
  }

}