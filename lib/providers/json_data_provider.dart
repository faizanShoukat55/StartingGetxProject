import 'package:get/get.dart';

import '../main.dart';
import '../models/setting_model.dart';
import '../utils/helper.dart';

class JsonApiClient extends GetxService {
  Future<JsonApiClient> init() async {
    return this;
  }

  Future<Setting> getAppSettings() async {
    var response = await Helper.getJsonFile('config/theme.json');
    return Setting.fromJson(response);
  }
}
