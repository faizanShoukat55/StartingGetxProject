import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mo_lines/utils/global_widgets/tag_button.dart';
import 'package:mo_lines/utils/images_provider.dart';

import '../../utils/ui.dart';

class NumberCardWidget extends StatelessWidget {
  NumberCardWidget({
    Key? key,
    required this.h,
    required this.w,
    this.name = 'Name',
    this.number,
    this.profilePictureUrl = '',
    this.imageShow = const [],
    this.onlineStatus,
  }) : super(key: key);

  final double h;
  final double w;
  String profilePictureUrl;
  String name;
  String? number;
  String? onlineStatus;
  List<String> imageShow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.01 * h,left: 0.01*w,right: 0.01*w),
      child: Container(

        padding: const EdgeInsets.only(left: 1, right: 0, top: 0, bottom: 10),
        decoration: Ui.getBoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Profile Image
            ClipRRect(
              // borderRadius: const BorderRadius.only(
              //     topLeft: Radius.circular(10),
              //     topRight: Radius.circular(10)),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: profilePictureUrl.isNotEmpty
                  ? CachedNetworkImage(
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                imageUrl: profilePictureUrl,
                placeholder: (context, url) => Image.asset(
                  // 'assets/img/loading.gif',
                  ImagesPath.imgGif,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 50,
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
              )
                  : Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      width: 1,
                    )),
              ),
            ),
            const SizedBox(width: 12),

            ///detail
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              name,
                              style: Get.textTheme.bodyText2,
                              maxLines: 3,
                              // textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0.02 * w,
                      ),
                      TagButton(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)
                          ),
                          // textColor: Get.theme.primaryColor,
                          style: Get.textTheme.labelSmall
                              ?.merge(TextStyle(color: Get.theme.primaryColor)),
                          // textColor: Get.theme.primaryColor,
                          buttonText: ' View ',
                          onTap: () {})
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        // 'View Full Profile',
                  number??"N/A",
                        style: Get.textTheme.bodyText1
                            ?.copyWith(color: Colors.blueAccent),
                        maxLines: 1,
                        // textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  // Divider(height: 8, thickness: 1),
                  // SizedBox(
                  //   height: 0.02 * h,
                  // ),
                  // Text('Photo Show'),
                  // PhotoShowWidget(
                  //   h: h,
                  //   w: w,
                  //   imageUrls: imageShow,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}