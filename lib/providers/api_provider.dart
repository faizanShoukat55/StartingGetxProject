import 'package:get/get.dart';

import '../services/global_service.dart';

mixin ApiClient {
  final globalService = Get.find<GlobalService>();
  String? baseUrl;

  String getBaseUrl(String path) {
    if (!path.endsWith('/')) {
      path += '/';
    }
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    if (!baseUrl!.endsWith('/')) {
      return baseUrl! + '/' + path;
    }
    return baseUrl! + path;
  }

  String getApiBaseUrl(String path) {
    String? _apiPath = globalService.global.value.apiPath;
    if (path.startsWith('/')) {
      return getBaseUrl(_apiPath!) + path.substring(1);
    }
    return getBaseUrl(_apiPath!) + path;
  }

  Uri getApiBaseUri(String path) {
    return Uri.parse(getApiBaseUrl(path));
  }

  Uri getBaseUri(String path) {
    return Uri.parse(getBaseUrl(path));
  }



  String getFileBaseUrl(String path) {
    //String? _filePath = globalService.global.value.filePath;
    if (path.startsWith('/')) {
      return getBaseUrl("") + path.substring(1);
    }
    return getBaseUrl("") + path;
  }
}
