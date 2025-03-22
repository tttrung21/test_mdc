import 'package:flutter/material.dart';

class ForgotPasswordVM extends ChangeNotifier{
  String _email = '';
  int _bodyIndex = 1;
  int get bodyIndex => _bodyIndex;

  int _resetOption = 1;
  int get resetOption => _resetOption;

  bool get isValidEmail => validateEmail();

  void onChangeEmail(String value){
    _email = value;
    notifyListeners();
  }

  void changeResetOption(int index){
    _resetOption = index;
    notifyListeners();
  }

  void changeBodyIndex(){
    if(validateEmail()) {
      _bodyIndex = 2;
      notifyListeners();
    }
  }
  bool validateEmail(){
    ///Mock validate email
    if(_email.contains('@')) return true;
    return false;
  }
}