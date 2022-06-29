import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/main_app_bar_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/record_button_widget.dart';
import '../../controllers/main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainModel createState() => _MainModel();
}

class _MainModel extends State<MainScreen> {
  // TODO: activate when transcription is done
  // final MainController _controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      appBar: MainAppBar(),
      child: Stack(
        children: [
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 137),
                  Text(
                    "hold".tr,
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
    );
  }
}
