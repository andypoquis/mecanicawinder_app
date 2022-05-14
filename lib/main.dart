import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/theme/dark_theme.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();

  print(GetStorage().read('success'));

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white, systemNavigationBarColor: Colors.black,
    systemNavigationBarDividerColor: Colors.black, // status bar color
  ));

  runApp(GetMaterialApp(
    scrollBehavior: MyBehavior(),
    debugShowCheckedModeBanner: false,
    initialRoute: (GetStorage().read('success') == null)
        ? Routes.INITIAL
        : (!GetStorage().read('success'))
            ? Routes.INITIAL
            : Routes.MENU,
    theme: appThemeData,
    defaultTransition: Transition.circularReveal,
    getPages: AppPages.pages,
  ));
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
