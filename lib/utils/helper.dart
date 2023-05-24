import 'dart:convert' as convert;
import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:intl_phone_field/countries.dart';
// import 'package:intl_phone_field/phone_number.dart';

import 'ui.dart';

class Helper {
  DateTime? currentBackPressTime;

  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }

  static Future<dynamic> getFilesInDirectory(String path) async {
    var files = io.Directory(path).listSync();
    print(files);
    // return rootBundle.(path).then(convert.jsonDecode);
  }

  static String toUrl(String path) {
    if (!path.endsWith('/')) {
      path += '/';
    }
    return path;
  }

  static String toApiUrl(String path) {
    path = toUrl(path);
    if (!path.endsWith('/')) {
      path += '/';
    }
    return path;
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.showSnackbar(Ui.defaultSnackBar(message: "Tap again to leave!".tr));
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  /*  PhoneNumber? getPhoneNumber(String number) {
    if (number != null) {
      number = number.replaceAll(' ', '');
      String dialCode3 = number.substring(0, 3);
      return PhoneNumber(
          countryISOCode: 'DE',
          countryCode: dialCode3,
          number: number.substring(3));
    }
    return null;
  }*/
  // static PhoneNumber? getPhoneNumber(String number) {
  //
  //   number = number.replaceAll(' ', '');
  //   String dialCode3 = number.substring(0, 3);
  //   String countryISOCode="PK";
  //   ///..........Just to get the flag
  //   for (int i = 0; i < countries.length; i++) {
  //     print("on");
  //     if (countries[i].dialCode == dialCode3.substring(1,3)) {
  //       countryISOCode = countries[i].code;
  //     }
  //   }
  //   PhoneNumber phoneNumber= PhoneNumber(
  //       countryISOCode: countryISOCode,
  //       countryCode: dialCode3,
  //       number: number.substring(3));
  //   return phoneNumber;
  // }
}
