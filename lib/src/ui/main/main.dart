import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lectly_client_user_mobile/src/ui/main/htr.dart';
import 'package:lectly_client_user_mobile/src/ui/main/transcription.dart';
import 'package:lectly_client_user_mobile/src/widgets/appBars/main_app_bar_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/buttons/record_fab_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/containers/background_container_widget.dart';
import '../../controllers/main.dart';
import './loading.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainModel createState() => _MainModel();
}

class _MainModel extends State<MainScreen> {
  final MainController _controller = Get.put(MainController());
  final _screens = [
    const HoldToRecordScreen(),
    const LoadingScreen(),
    TranscriptionScreen()
  ];

  Widget _fab(int val) {
    if (val == 2) {
      return const RecordFloatingActionButton();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      appBar: MainAppBar(),
      floatingActionButton: GetBuilder<MainController>(
          builder: (_controller) => _fab(_controller.screenIdx.value)),
      child: Center(
        child: GetBuilder<MainController>(
            builder: (_controller) => _screens[_controller.screenIdx.value]),
      ),
    );
  }
}
