import 'package:circlify/resources/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:circlify/models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User get getUser =>
      _user ??
      const User(
          username: 'username',
          uid: 'uid',
          email: 'email',
          photoUrl: 'photoUrl',
          followers: [0],
          following: [0]);

  Future<void> refreshUser() async {
    User user = await AuthMethods().getUserDetails();
    _user = user;
    notifyListeners();
  }
}
