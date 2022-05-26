import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/ui/splash/splash.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/app_bar_widget.dart';
import 'package:lectly_client_user_mobile/src/utils/internet_checker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Internet internet = Internet();
  final FirebaseAuth auth = FirebaseAuth.instance;
  List getUserData()  {
    final User? user = auth.currentUser;
    final String? userName =  user?.displayName;
    final String? userEmail =  user?.email;
    return[ userName,userEmail];
  }


  bool isStopped = false;
  sec5Timer() {

    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (isStopped) {
        timer.cancel();
      }
      if (mounted) {
        internet.swapAnyScreen(context);
      }
    });
  }

  @override
  void initState() {
    sec5Timer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var padding = width * 0.06;
    return Scaffold(
      body: BackgroundContainer(
        child: Stack(
          children: [
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Appbar(),
                    const SizedBox(
                      height: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: padding),
                          child: Text(
                            "hello".tr+   (getUserData())[0],
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: "Cairo",
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: padding),
                          child: Text(
                            "email".tr,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: "Cairo",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: padding),
                          child: Text(
                            (getUserData())[1],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: "Cairo",
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                              width: 256,
                              height: 53,
                              child: OutlinedButton(
                                child: Text('logout'.tr),
                                style: OutlinedButton.styleFrom(
                                  primary: AppColors.primaryColorDark,
                                  backgroundColor: AppColors.primaryColor,
                                  side: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 256),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  textStyle: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SplashScreen()));
                                },
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
