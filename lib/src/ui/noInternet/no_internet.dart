import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/utils/internet_checker.dart';
import 'package:lectly_client_user_mobile/src/widgets/containers/background_container_widget.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  final Internet internet = Internet();

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
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "noInternet".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontFamily: "Cairo",
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/warning.png",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "check".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontFamily: "Cairo",
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      internet.noInternetScreen(context);
                    },
                    child: Text('try_again'.tr),
                    style: OutlinedButton.styleFrom(
                      primary: AppColors.primaryColor,
                      side: const BorderSide(
                          color: AppColors.primaryColor, width: 1),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      textStyle: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontFamily: "Cairo",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
