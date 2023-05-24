import 'package:get/get.dart';
import 'package:mo_lines/module/dashboard/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }

}