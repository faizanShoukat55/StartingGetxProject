import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mo_lines/module/tabs/numbers_view/controller/numbers_controller.dart';

import '../../../utils/custom_colors.dart';
import '../../widgets/number_card_widget.dart';

class HomePage extends GetView<NumbersController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery
    //     .of(context)
    //     .size;
    // return  Container(
    //   color: tab1BgColor,
    //     height: size.height,
    //     width: size.width,
    //     child: const Center(child: Text("Numbers Page",style: TextStyle(color: Colors.white),)));
    Get.put(NumbersController());
    return Scaffold(
      body: CustomScrollView(
          slivers:<Widget>[
          SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                      NumberCardWidget(
                        h: context.height,
                        w: context.width,
                        name: controller.numbersList[index]['name'],
                        number: controller.numbersList[index]['number'],
                        profilePictureUrl: controller.numbersList[index]['profilePictureUrl'],
                        imageShow: controller.numbersList[index]['imageShow'],
                        onlineStatus: controller.numbersList[index]['onlineStatus'],
                      ),
                  childCount: controller.numbersList.length)),
        ]

      )
    ).paddingSymmetric(vertical: 1,horizontal: 10);
  }
}
