import 'package:flutter/material.dart';

class SignUpVM extends ChangeNotifier {
  String _fullName = '';
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _showPassword = true;

  bool _isAgreeTerm = false;

  bool get isAgreeTerm => _isAgreeTerm;

  bool get showPassword => _showPassword;

  bool get isValidEmail => validateEmail();

  void onChangeFullName(String val){
    _fullName = val;
    notifyListeners();
  }

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

  void toggleAgreeTerm(){
    _isAgreeTerm = !_isAgreeTerm;
    notifyListeners();
  }

  void togglePassword(){
    _showPassword = !_showPassword;
    notifyListeners();
  }
}
