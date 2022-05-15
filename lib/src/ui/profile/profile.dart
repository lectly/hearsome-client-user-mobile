import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/ui/splash/splash.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/app_bar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                            padding: EdgeInsets.only(left: 24.0),
                         child: const Text(
                            "Hello, <Username>👋",
                            style: TextStyle(
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
                          padding: EdgeInsets.only(left: 24.0),
                          child: const Text(
                            "Email",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: "Cairo",
                              fontSize: 14.0,

                          ),
                        ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.0),
                        child: const Text(
                            "<example@email.com>",
                            textAlign: TextAlign.left,
                            style: TextStyle(
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
                                child: const Text('Logout'),
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
