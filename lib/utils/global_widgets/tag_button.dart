import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TagButton extends StatelessWidget {
  TagButton(
      {Key? key,
      required this.borderRadius,
      required this.buttonText,
      required this.onTap,
      this.textColor = Colors.white,
      this.style,
      this.padding
      // this.textColor=Colors.indigo,
      })
      : super(key: key);
  BorderRadius borderRadius;
  String buttonText;
  final VoidCallback? onTap;
  Color textColor;
  TextStyle? style = Get.textTheme.bodyText2;
  double? padding = 10;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // onTap: (){
      //   onTap!;
      // },
      child: Container(
        decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary,
            borderRadius: borderRadius),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 10),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              buttonText,
              style: style != null
                  ? style?.copyWith(color: textColor)
                  : Get.textTheme.bodyText2?.copyWith(color: textColor)
                  // : TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
