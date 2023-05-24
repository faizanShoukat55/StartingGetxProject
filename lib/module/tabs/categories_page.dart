import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Container(
      color: tab2BgColor,
        height: size.height,
        width: size.width,
        child: const Center(child: Text("SMS Page",style: TextStyle(color: Colors.white),)));
  }
}
