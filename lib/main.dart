import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:mo_lines/providers/json_data_provider.dart';
import 'package:mo_lines/routes/app_pages.dart';
import 'package:mo_lines/services/global_service.dart';
import 'package:mo_lines/services/settings_service.dart';
import 'package:mo_lines/services/translation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Logger logger=Logger();

Future<bool> initServices() async{
  Get.log("starting services");
  await GetStorage.init();
  await Get.putAsync(() => TranslationService().init());
  await Get.putAsync(() => GlobalService().init());
  await Get.putAsync(() => JsonApiClient().init());
  await Get.putAsync(() => SettingsService().init());

  Get.log("All services has been started.");
  return true;
}
void main() async{
  ///Init Services
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  ///Error Widget Screen
  ErrorWidget.builder=(FlutterErrorDetails details) => Material(
    color: Colors.green.shade200,
    child: Center(
        child: Text(details.exception.toString(),
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        )
    ),
  );

  runApp(

    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onReady: (){

      },
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: Get.find<TranslationService>().supportedLocales(),
      translationsKeys: Get.find<TranslationService>().translations,
      locale: Get.find<SettingsService>().getLocale(),
      themeMode: Get.find<SettingsService>().getThemeMode(),
      theme: Get.find<SettingsService>().getLightTheme(),
      darkTheme: Get.find<SettingsService>().getDarkTheme(),
      title: Get.find<SettingsService>().setting.value.appName??"",
    )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.initial ,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
    );

    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}


