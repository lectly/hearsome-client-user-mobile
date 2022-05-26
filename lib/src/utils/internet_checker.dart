import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/ui/onBoarding/on_boarding.dart';

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

  checkInternetSplashScreen(context) {
    Internet.checkConnectivity().then((isConnected) {
      Timer(const Duration(seconds: 5), () {
        if (isConnected) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const OnBoardingScreen())); //after merging i will replace with onboarding
          return;
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NoInternetScreen()));
      });
    });
  }

  swapAnyScreen(context) {
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
