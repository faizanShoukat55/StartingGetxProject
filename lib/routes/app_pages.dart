import 'package:get/get.dart' show GetPage, Transition;
import 'package:mo_lines/module/authentication/binding/auth_binding.dart';
import 'package:mo_lines/module/authentication/views/login_view.dart';
import 'package:mo_lines/module/help_page/help_page.dart';
import '../module/dashboard/binding/dashboard_binding.dart';
import '../module/dashboard/view/dashboard.dart';
import 'app_routes.dart';

class AppPages {
   static const initial = Routes.login;
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: Routes.dashBoard,
      page: () => const Dashboard(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: Routes.helpPage,
      page: () => const HelpPage(),
    ),



  ];
}
