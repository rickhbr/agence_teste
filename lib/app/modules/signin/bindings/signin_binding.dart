import 'package:agence_test/app/modules/signin/controllers/signin_controller.dart';
import 'package:get/get.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(
      () => SigninController(),
    );
  }
}
