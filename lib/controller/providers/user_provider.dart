// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tambola_frontend/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(user: UserClass(), token: "");
//  = User(name: "", language: "english", mobile: "", password: "");
  bool _isNameEditing = false;
  bool _isEmailEditing = false;

  bool _isMobileEditing = false;

  User get user => _user;

  void setUser(User user) {
    _user = user;
    print("set user success ${_user.user.id}");
    notifyListeners();
  }

  bool get isNameEditing => _isNameEditing;
  bool get isEmailEditing => _isEmailEditing;
  bool get isMobileEditing => _isMobileEditing;
  setEditing(EditType type, bool val) {
    switch (type) {
      case EditType.Name:
        _isNameEditing = val;
        notifyListeners();

        break;
      case EditType.Email:
        _isEmailEditing = val;
        notifyListeners();

        break;
      case EditType.Mobile:
        _isMobileEditing = val;
        notifyListeners();

        break;
      default:
    }
  }
}

enum EditType { Name, Email, Mobile }
