import 'package:agence_test/app/modules/blank/views/blank_view.dart';
import 'package:agence_test/app/modules/home/bindings/home_binding.dart';
import 'package:agence_test/app/modules/home/views/home_view.dart';
import 'package:agence_test/app/modules/product/bindings/product_binding.dart';
import 'package:agence_test/app/modules/product/views/product_view.dart';
import 'package:agence_test/app/modules/signin/bindings/signin_binding.dart';
import 'package:agence_test/app/modules/signin/views/signin_view.dart';
import 'package:agence_test/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:agence_test/app/modules/welcome/views/welcome_view.dart';
import 'package:agence_test/app/splash_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => SplashScreenPage(),
    ),
    GetPage(
      name: PagesRoutes.welcome,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: PagesRoutes.homeRoute,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: PagesRoutes.blankRoute,
      page: () => BlankView(),
    ),
    GetPage(
      name: PagesRoutes.productsRoute,
      page: () => ProductView(
        nomeProduto: '',
      ),
      binding: ProductBinding(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String splashRoute = '/';
  static const String welcome = '/welcome';
  static const String homeRoute = '/home';
  static const String signInRoute = '/signIn';
  static const String blankRoute = '/blank';
  static const String productsRoute = '/products';
}
