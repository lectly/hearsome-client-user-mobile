import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:lectly_client_user_mobile/src/utils/uploadToS3.dart';
import '../constants/colors.dart';
import '../utils/permissions.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({Key? key}) : super(key: key);

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  final UploadToS3 uploadToS3 = UploadToS3();
  final Permissions permissions = Permissions();
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: "audio.aac");
  }

  Future stop() async {
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    uploadToS3.upload(audioFile);
    print('Recorded audio: $audioFile');
  }

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  Future initRecorder() async {
    permissions.CheckPermissions();
    await recorder.openRecorder();
    isRecorderReady = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64.0),
        color: AppColors.primaryColor,
      ),
      child: GestureDetector(
        child: const Icon(
          Icons.mic,
          color: AppColors.primaryColorDark,
          size: 65,
        ),
        onTapDown: (detail) async {
          await record();

          setState(() {});
        },
        onTapUp: (detail) async {
          await stop();

          setState(() {});
        },
      ),
    );
  }
}
