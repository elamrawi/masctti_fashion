import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/routes.dart';
import 'package:masctti_fashion/views/auth/Login.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

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
          brightness: Brightness.light,
          textTheme: TextTheme(labelMedium: TextStyle(fontSize: 16)),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: MaterialColor(0xffBF3027, colorCodes),
          // primaryColor: Color(0xffBF3027),
          appBarTheme: const AppBarTheme(
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
