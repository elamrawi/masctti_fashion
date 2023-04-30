import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:masctti_fashion/routes.dart';
/**
 * information api
 * consumer key : ck_d73fcf02d2529fae157aee1f7c421d166016a908
 * consumer secret : cs_57c29d9a8724d599c4c5dc29c52cd5222cd39f9b
 * 
 * information google map
 * key api : AIzaSyBhXsfzoL2EpCOIHeNY1h3AIvUYCCEaG6g
 */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // إذا ظهر خطأ فهو من هنا
  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(App());
}

/**
 * notes:
 * add controllers to screen in home,category,order... and use Get.put(pemnert: true) becuse no remove data
 */

class App extends StatelessWidget {
  App({super.key});
  final Map<int, Color> colorCodes = {
    50: Color.fromRGBO(191, 48, 39, .1),
    100: Color.fromRGBO(191, 48, 39, .2),
    200: Color.fromRGBO(191, 48, 39, .3),
    300: Color.fromRGBO(191, 48, 39, .4),
    400: Color.fromRGBO(191, 48, 39, .5),
    500: Color.fromRGBO(191, 48, 39, .6),
    600: Color.fromRGBO(191, 48, 39, .7),
    700: Color.fromRGBO(191, 48, 39, .8),
    800: Color.fromRGBO(191, 48, 39, .9),
    900: Color.fromRGBO(191, 48, 39, 1),
  };

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(labelMedium: TextStyle(fontSize: 16)),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: MaterialColor(0xffBF3027, colorCodes),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            titleTextStyle: TextStyle(
                fontSize: 17,
                color: Color(0xff282828),
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal'),
          ),
          fontFamily: 'Tajawal'),
      textDirection: TextDirection.rtl,
      getPages: routes,
    );
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
