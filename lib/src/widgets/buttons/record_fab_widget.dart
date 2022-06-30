import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/controllers/main.dart';
import 'package:lectly_client_user_mobile/src/utils/recorder.dart';
import 'dart:io';

class RecordFloatingActionButton extends StatefulWidget {
  const RecordFloatingActionButton({Key? key}) : super(key: key);

  @override
  State<RecordFloatingActionButton> createState() =>
      _RecordFloatingActionButtonState();
}

class _RecordFloatingActionButtonState
    extends State<RecordFloatingActionButton> {
  final Recorder _recorder = Recorder();
  final MainController _controller = Get.find();

  @override
  void initState() {
    super.initState();
    _recorder.initRecorder();
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 56,
        width: 56,
        child: const Icon(
          Icons.mic,
          color: AppColors.primaryColorDark,
          size: 28,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64.0),
            color: AppColors.primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 4),
              )
            ]),
      ),
      onTapDown: (detail) async {
        await _recorder.record();
      },
      onTapUp: (detail) async {
        File file = await _recorder.stop();
        _controller.transcribe(file);
      },
    );
  }
}
