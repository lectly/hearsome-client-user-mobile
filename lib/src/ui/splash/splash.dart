import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/ui/no_internet.dart';
import 'package:lectly_client_user_mobile/src/ui/onBoarding/on_boarding.dart';
import 'package:lectly_client_user_mobile/src/utils/internet_checker.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  checkInternet() {
    Internet.checkConnectivity().then((isConnected) {
      Timer(const Duration(seconds: 5), () {
        if (isConnected) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen()));
          return;
        }
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NoInternetScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Stack(
          children: [
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                    ),
                    const Text(
                      "hearsome",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: "Cairo",
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              child: Align(
                alignment: Alignment(0.0, 0.75),
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.secondaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
