import 'package:agence_test/app/globals/services/auth_facebook_service.dart';
import 'package:agence_test/app/globals/services/auth_google_service.dart';
import 'package:agence_test/app/globals/services/navigation_service.dart';
import 'package:agence_test/app/data/models/user_model.dart';
import 'package:agence_test/app/routes/app_routes.dart';
import 'package:agence_test/app/widgets/toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  Rx<UserAgence> userAgence = UserAgence().obs;

  Future<void> signinGoogle(BuildContext context) async {
    try {
      isLoading(true);
      await AuthGoogleService().signInWithGoogle(context);
      final user = FirebaseAuth.instance.currentUser;
      userAgence.value = UserAgence(name: user!.displayName, email: user.email);
      Toast.showToast(
        context: context,
        text: "Login com o Google realizado com sucesso!",
        error: false,
      );
    } catch (e) {
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> signimFacebook(BuildContext context) async {
    try {
      isLoading(true);
      await AuthFacebookService().signInWithFacebook(context);
      final user = FirebaseAuth.instance.currentUser;
      userAgence.value = UserAgence(name: user!.displayName, email: user.email);
      Toast.showToast(
        context: context,
        text: "Login com o Facebook realizado com sucesso!",
        error: false,
      );
    } catch (e) {
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    userAgence.value = UserAgence(name: '', email: '');
    NavigationService.replace(PagesRoutes.signInRoute);
    dispose();
  }
}
