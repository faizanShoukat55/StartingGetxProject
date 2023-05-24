
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_colors.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: context.theme.colorScheme.secondary,
            size: 20,
          ),
          onPressed: () => {Get.back()},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          color: tab4BgColor,
          height: size.height,
          width: size.width,
          child: const Center(child: Text("Help Page",style: TextStyle(color: Colors.white),)))
    );
  }
}
