import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/routes/app_routes.dart';
import 'package:agence_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Agence',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: CustomColors.customAccentColor,
        scaffoldBackgroundColor: CustomColors.customPrimaryColor,
      ),
      initialRoute: PagesRoutes.welcome,
      getPages: AppPages.pages,
    );
  }
}
