import 'package:flutter/material.dart';
import 'package:practice/CODE/1%20-%20START%20CODE/data/services/auth_service.dart';
import 'auth_screen.dart';

import 'scores_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  void onLogin() {
    setState(() {});
  }

  void onLogout() {
    setState(() {
      AuthenticationService.instance.session = null; //delete session => isLogged = false
    });
  }

  Widget get content {
    bool isLogged = AuthenticationService.instance.isLoggedIn;

    // if logged in -> Display ScoresScreen
    if (isLogged) {
      return ScoresScreen(onLogout: onLogout);
    }

    // otherwise -> DisplayAuthScreen
    return AuthScreen(onLogin: onLogin);
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
