import 'package:flutter/material.dart';

class NewPasswordVM extends ChangeNotifier{
  String _password = '';

  bool _showPassword = false;

  bool get showPassword => _showPassword;

  bool get isValidLength => isEnoughLength();

  bool get isHasNumber => hasOneNumber();

  bool get isValidatePassword => validatePassword();

  void onChangePassword(String password){
    _password = password;
    notifyListeners();
  }

  bool validatePassword(){
    return isEnoughLength() && hasOneNumber();
  }

  bool isEnoughLength(){
    return _password.length >= 8;
  }

  bool hasOneNumber(){
    return _password.contains(RegExp(r'\d'));
  }

  void togglePassword(){
    _showPassword = !_showPassword;
    notifyListeners();
  }
}