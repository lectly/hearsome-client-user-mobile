import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/utils/internet_checker.dart';
import 'package:lectly_client_user_mobile/src/widgets/containers/background_container_widget.dart';

import '../onBoarding/on_boarding.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  bool isLoading = false;

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
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      if (!await Internet.checkConnectivity()) {
                        setState(() {
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text('No Internet Connection! Please Try Again'),
                        ));
                      } else {
                        Navigator.of(context).maybePop().then((popped) {
                          if (!popped) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OnBoardingScreen()));
                          }
                        });
                      }
                    },
                    child: (isLoading)
                        ? const CircularProgressIndicator(
                            color: AppColors.secondaryColor,
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border:
                                    Border.all(color: AppColors.primaryColor)),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'try_again'.tr,
                              style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontFamily: "Cairo",
                              ),
                            )),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.transparent,
                      side: const BorderSide(color: AppColors.transparent),
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
