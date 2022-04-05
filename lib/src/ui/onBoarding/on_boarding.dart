import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/widgets/drop_down_button_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/google_signIn_button_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/horizontal_logo_widget.dart';

import '../../constants/colors.dart';
import '../../widgets/background_container_widget.dart';
import '../../widgets/drop_down_button_widget.dart';

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
            Positioned(
              child: Align(
                alignment: const Alignment(0.0, -0.85),
                child: HorizontalLogo(),
              ),
            ),
            Positioned(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Stay Connected",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: "Cairo",
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      "assets/images/on_boarding.png",
                    ),
                    const Text(
                      "	Speech-to-Text tool that will \n keep you engaged the whole day \n socializing, shopping, working and more.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        height: 1.5,
                        fontFamily: "Cairo",
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Positioned(
                      child: GoogleSignInButton(),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              child: DropDownList(),
            ),
          ],
        ),
      ),
    );
  }
}
