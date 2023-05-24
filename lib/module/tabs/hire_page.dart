import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class HirePage extends StatelessWidget {
  const HirePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Container(
      color: tab3BgColor,
        height: size.height,
        width: size.width,
        child: const Center(child: Text("Plans Page",style: TextStyle(color: Colors.white),)));
  }
}
