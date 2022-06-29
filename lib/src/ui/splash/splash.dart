import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/utils/internet_checker.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Internet internet = Internet();
  @override
  void initState() {

    super.initState();
    internet.checkInternetSplashScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
        child: Stack(
          children: [
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/v-logo.png",
                      width: 128.0,
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
    );
  }
}
