import 'package:agence_test/app/globals/services/navigation_service.dart';
import 'package:agence_test/app/routes/app_routes.dart';
import 'package:agence_test/app/widgets/toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthGoogleService {
  signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);

      // Redirecionar para a nova tela após o login bem-sucedido
      NavigationService.push(PagesRoutes.homeRoute);
    } catch (e) {
      // Exibir erro em caso de falha no login
      Toast.showToast(
        context: context,
        text: "Falha no login: $e",
        error: true,
      );
    }
  }
}
