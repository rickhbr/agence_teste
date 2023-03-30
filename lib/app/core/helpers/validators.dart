abstract class Validates {
  static bool validateUpper(String password) {
    final passwordValid = RegExp(r'^(?=.*?[A-Z])');
    return passwordValid.hasMatch(password);
  }

  static bool validateNumber(String password) {
    final passwordValid = RegExp(r'^(?=.*?[0-9])');
    return passwordValid.hasMatch(password);
  }

  static bool validateCharactere(String password) {
    final passwordValid = RegExp(r'^(?=.*?[!@#\$&*~+-.,/;?!=])');
    return passwordValid.hasMatch(password);
  }

  static bool validateLogin(String login) {
    final loginValid = RegExp(r'^[A-Z]{1}[0-9]{6}$');
    return loginValid.hasMatch(login);
  }
}
