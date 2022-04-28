import 'package:lectly_client_user_mobile/src/utils/internet_checker.dart';
import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/ui/home_screen.dart';

class InternetNavigate {
  static navigate(context) {
    Internet.checkConnectivity().then((isConnected) {
      if (isConnected) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        return;
      }
    });
  }
}
