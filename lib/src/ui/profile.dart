import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/ui/splash/splash.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/app_bar_widget.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
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
                     Container(
                       child: Appbar(),
                     ),
                   const SizedBox(height: 32,),
                   Column(
                       children: [
                     Container(
                     padding: const EdgeInsets.only(right: 116.0),
                      child: Text(

                      "Hello, <Username>👋",
                      style: TextStyle(

                        color: AppColors.primaryColor,
                        fontFamily: "Cairo",
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   ),
                     const SizedBox(height: 24,),
                   Container(
                     padding: const EdgeInsets.only(right: 303.0),
                     child: Text(
                       "Email",
                       textAlign: TextAlign.left,
                       style: TextStyle(
                         color: AppColors.primaryColor,
                         fontFamily: "Cairo",
                         fontSize: 14.0,
                       ),
                     ),
                   ),
                     Container(
                       padding: const EdgeInsets.only(right: 176.0),
                       child: Text(
                         "<example@email.com>",
                         textAlign: TextAlign.left,
                         style: TextStyle(
                           color: AppColors.primaryColor,
                           fontFamily: "Cairo",
                           fontSize: 16.0,
                         ),
                       ),
                     ),
                     const SizedBox(height: 24,),
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 256,
                          height: 53,

                          child: OutlinedButton(
                            child: Text('Logout'),
                            style: OutlinedButton.styleFrom(

                              primary: AppColors.primaryColorDark,
                              backgroundColor: AppColors.primaryColor,
                              side: const BorderSide(color: AppColors.primaryColor, width: 256),
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 20,
                                fontFamily: "Roboto",
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => const SplashScreen()));
                            },
                          )
                      ),
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

