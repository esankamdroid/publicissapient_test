import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/pages.dart';

void main() {
  runApp(PublicisSapientApp());
}

class PublicisSapientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      enableLog: true,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        colorScheme: ColorScheme.light(),
        accentColorBrightness: Brightness.light,
      ),
      getPages: Pages.routes,
      initialRoute: Pages.INITIAL,
    );
  }
}
