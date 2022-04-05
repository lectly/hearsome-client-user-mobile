import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/ui/profileScreen.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';
import 'package:lectly_client_user_mobile/src/utils/internet_checker.dart';
import 'package:lectly_client_user_mobile/src/ui/home_screen.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
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

                    const SizedBox(
                      height: 60,
                    ),

                    const Text(
                      "No Internet Connection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
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

                    const Text(
                      "Please check your connection!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: "Cairo",
                        fontSize: 16.0,


                      ),
                    ),
                    const SizedBox(height: 20,),
                 OutlinedButton(
                  onPressed: () {


                      Internet.checkConnectivity().then((isConnected) {

                          if (isConnected) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => const HomePage()));
                            return;
                          }
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const NoInternetScreen()));
                        });


                  },
                  child: const Text('Try Again'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    side: const BorderSide(color: Colors.white, width: 1),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Cairo",
                    ),
                  ),)
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


