

import 'package:get/get.dart';
import 'package:mo_lines/providers/json_data_provider.dart';

import '../models/setting_model.dart';

class SettingRepository {
  JsonApiClient? _jsonApiClient;

  SettingRepository() {
    _jsonApiClient = Get.find<JsonApiClient>();
  }

  Future<Setting> get() {
    return _jsonApiClient!.getAppSettings();
  }

  // Future<List<Address>> getAddresses() {
  //   return _laravelApiClient!.getAddresses();
  // }
}
