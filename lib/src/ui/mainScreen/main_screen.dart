import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/main_screen_app_bar.dart';
import 'package:lectly_client_user_mobile/src/utils/permissions.dart';




class MainScreen extends StatefulWidget {

  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 final Permissions permissions = Permissions();
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
                     const SizedBox(height: 137,),
                          const Text(
                            "Hold to record",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: "Cairo",
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        const SizedBox(height: 20,),

                    SizedBox(
                    height: 128,
                    width: 128,
                    child:ElevatedButton(
                      child: Image.asset('assets/images/mic.png'),
                      onPressed: () {
                        permissions.CheckPermissions();
                      },
                      style: ElevatedButton.styleFrom(
                        shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(64.0),

                    ),
                        primary: AppColors.primaryColor,
                      ),
                    ),
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


