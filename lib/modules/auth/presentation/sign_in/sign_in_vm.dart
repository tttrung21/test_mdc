import 'package:flutter/material.dart';

class SignInVM extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _showPassword = true;

  bool get showPassword => _showPassword;

  bool get isValidEmail => validateEmail();

  void onChangeEmail(String val){
    _email = val;
    notifyListeners();
  }

  void onChangePassword(String val){
    _password = val;
    notifyListeners();
  }

  bool validateEmail(){
    ///Mock validate email
    if(_email.contains('@')) return true;
    return false;
  }

  void togglePassword(){
    _showPassword = !_showPassword;
    notifyListeners();
  }
}
