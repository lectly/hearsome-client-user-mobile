import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/controllers/main.dart';
import 'package:lectly_client_user_mobile/src/utils/recorder.dart';
import 'dart:io';

class RecordButton extends StatefulWidget {
  const RecordButton({Key? key}) : super(key: key);

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
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
        height: 108,
        width: 108,
        child: const Icon(
          Icons.mic,
          color: AppColors.primaryColorDark,
          size: 64,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64.0),
          color: AppColors.primaryColor,
        ),
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
