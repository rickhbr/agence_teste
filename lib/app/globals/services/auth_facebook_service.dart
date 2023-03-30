import 'package:agence_test/app/globals/services/navigation_service.dart';
import 'package:agence_test/app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthFacebookService {
  Future<UserCredential> signInWithFacebook(BuildContext context) async {
    try {
      // Realizar a autenticação com o Facebook
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Checar se a autenticação foi bem-sucedida
      if (loginResult.status == LoginStatus.success) {
        // Obter as credenciais de acesso do Facebook
        final AccessToken accessToken = loginResult.accessToken!;
        final AuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        // Fazer o login no Firebase com as credenciais do Facebook
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Redirecionar para a nova tela após o login bem-sucedido
        NavigationService.push(PagesRoutes.homeRoute);

        return userCredential;
      } else if (loginResult.status == LoginStatus.cancelled) {
        // Caso o usuário tenha cancelado o login
        throw FirebaseAuthException(
          code: 'ERROR_FACEBOOK_LOGIN_CANCELLED',
          message: 'Facebook login cancelled by user.',
        );
      } else {
        // Caso ocorra algum erro na autenticação
        throw FirebaseAuthException(
          code: 'ERROR_FACEBOOK_LOGIN_FAILED',
          message: 'Facebook login failed. ${loginResult.message}',
        );
      }
    } catch (e) {
      // Lidar com qualquer erro que ocorra durante o login
      throw FirebaseAuthException(
        code: 'ERROR_FACEBOOK_LOGIN_FAILED',
        message: 'Facebook login failed. $e',
      );
    }
  }
}
