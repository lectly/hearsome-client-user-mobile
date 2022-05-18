import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/main_screen_app_bar.dart';
import 'package:lectly_client_user_mobile/src/utils/permissions.dart';
import 'package:lectly_client_user_mobile/src/widgets/mic_button_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

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
                    const SizedBox(height: 137),
                    Text(
                      "hold".tr,
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
                    const SizedBox(
                      height: 128,
                      width: 128,
                      child: RecordButton(),
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
