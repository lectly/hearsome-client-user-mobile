import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/widgets/drop_down_button_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/google_signin_button_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/horizontal_logo_widget.dart';

import '../../constants/colors.dart';
import '../../widgets/background_container_widget.dart';
import '../../widgets/drop_down_button_widget.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Stack(
          children: [
            const Positioned(
              child: Align(
                alignment: Alignment(0.0, -0.85),
                child: HorizontalLogo(),
              ),
            ),
            Positioned(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "connected".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: "Cairo",
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      "assets/images/on_boarding.png",
                      height: 200.0,
                    ),
                    Text(
                      "message".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        height: 1.5,
                        fontFamily: "Cairo",
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const GoogleSignInButton(),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0.0, 0.9),
              child: DropDownList(),
            ),
          ],
        ),
      ),
    );
  }
}
