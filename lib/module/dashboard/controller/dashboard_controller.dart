import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mo_lines/module/tabs/categories_page.dart';
import 'package:mo_lines/module/tabs/discover_page.dart';
import 'package:mo_lines/module/tabs/hire_page.dart';
import '../../tabs/numbers_view/numbers_view.dart';

class DashboardController extends GetxController{
  final currentIndex = 0.obs;


  List<Widget> pages = [
    const HomePage(),
    const CategoriesPage(),
    const HirePage(),
    const DiscoverPage(),

  ];

  Widget get currentPage => pages[currentIndex.value];

  /// change page in route
  Future<void> changePage(int index) async {
    currentIndex.value = index;
  }
}