import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeController extends GetxController {
  void onInit() {
    super.onInit();
  }

  launchLinkedin() async {
    final Uri uri =
        Uri.parse('https://www.linkedin.com/in/rick-ramos-00a94a138/');
    if (await launchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  launchCodeProject() async {
    final Uri uri = Uri.parse('https://github.com/rickhbr/agence_teste/');
    if (await launchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
