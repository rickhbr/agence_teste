import 'package:get/get.dart';

abstract class NavigationService {
  static void push(String route) {
    Get.toNamed(route);
  }

  static void pushWithParams({
    required String route,
    required Map<String, dynamic> params,
  }) {
    Get.toNamed(route, arguments: params);
  }

  static void replace(String route) {
    Get.offNamed(route);
  }

  static void replaceWithParams({
    required String route,
    required Map<String, dynamic> params,
  }) {
    Get.offNamed(route, arguments: params);
  }

  static void goBack() {
    Get.back();
  }
}
