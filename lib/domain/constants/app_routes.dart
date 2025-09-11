import 'package:ecomm_391/ui/detail/detail_page.dart';
import 'package:ecomm_391/ui/login/login.dart';
import 'package:ecomm_391/ui/sign_up/sign_up.dart';
import 'package:flutter/cupertino.dart';

import '../../ui/dashboard/dashboard_page.dart';
import '../../ui/splash/splash_page.dart';

class AppRoutes{

  static const String splash = '/';
  static const String intro = '/intro';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String dashboard = '/dashboard';
  static const String productDetail = '/product_detail';

  static Map<String, WidgetBuilder> mRoutes = {
    splash: (context) => const SplashScreen(),
    //intro: (context) => const IntroPage(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    dashboard: (context) => const DashboardPage(),
    productDetail: (context) => const ProductDetails(),
  };

}