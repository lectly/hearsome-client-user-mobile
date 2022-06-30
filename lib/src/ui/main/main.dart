import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/widgets/appBars/main_app_bar_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/buttons/record_button_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/containers/background_container_widget.dart';
import '../../controllers/main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainModel createState() => _MainModel();
}

class _MainModel extends State<MainScreen> {
  final MainController _controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      appBar: MainAppBar(),
      child: Center(
        child: Container(
            margin: const EdgeInsets.only(top: 32),
            child: Column(
              children: [
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
                  height: 16,
                ),
                const RecordButton(),
              ],
            )),
      ),
    );
  }
}
