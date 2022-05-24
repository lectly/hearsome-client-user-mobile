import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../ui/home_screen.dart';
import '../ui/no_internet/no_internet.dart';

class Internet {
  static Future<bool> checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  checkInternet_splashScreen(context) {
    Internet.checkConnectivity().then((isConnected) {
      Timer(const Duration(seconds: 5), () {
        if (isConnected) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const HomePage())); //after merging i will replace with onboarding
          return;
        }
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NoInternetScreen()));
      });
    });
  }

  SwapAnyScreen(context) {
    Internet.checkConnectivity().then((isConnected) {
      if (isConnected) {
        return;
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NoInternetScreen()));
      }
    });
  }

  noInternetScreen(context) {
    Internet.checkConnectivity().then((isConnected) {
      if (isConnected) {
        Navigator.of(context).maybePop();
      } else {
        return;
      }
    });
  }
}
