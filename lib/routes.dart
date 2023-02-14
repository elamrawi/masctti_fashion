import 'package:get/get.dart';
import 'package:masctti_fashion/views/Home.dart';
import 'package:masctti_fashion/views/auth/ForgotPassword.dart';
import 'package:masctti_fashion/views/auth/Login.dart';
import 'package:masctti_fashion/views/auth/NewPassword.dart';
import 'package:masctti_fashion/views/auth/PasswordRecovery.dart';
import 'package:masctti_fashion/views/auth/SignUp.dart';
import 'package:masctti_fashion/views/profile/AboutUs.dart';
import 'package:masctti_fashion/views/profile/ChangePassword.dart';
import 'package:masctti_fashion/views/profile/Favorite.dart';
import 'package:masctti_fashion/views/profile/PaymentEdit.dart';
import 'package:masctti_fashion/views/profile/PresonalInfo.dart';
import 'package:masctti_fashion/views/profile/Profile.dart';

final List<GetPage> routes = [
  GetPage(name: '/', page: () => Login()),
  // authientcation screens
  GetPage(name: '/login', page: () => Login()),
  GetPage(name: '/sign-up', page: () => SignUp()),
  GetPage(name: '/forgot-password', page: () => ForgotPassword()),
  GetPage(name: '/new-password', page: () => NewPassword()),
  GetPage(name: '/password-recovery', page: () => PasswordRecovery()),
  // profile screens
  GetPage(name: '/profile', page: () => Profile()),
  GetPage(name: '/personal-info', page: () => PersonalInfo()),
  GetPage(name: '/change-password', page: () => ChangePassword()),
  GetPage(name: '/payment-edit', page: () => PaymentEdit()),
  GetPage(name: '/about-us', page: () => AboutUs()),
  GetPage(name: '/favorite', page: () => Favorite()),
];
