import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';

import '../constants/colors.dart';
import '../utils/permissions.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({Key? key}) : super(key: key);

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  final Permissions permissions = Permissions();
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: "audio");
  }

  Future stop() async {
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();

    final audioFile = File(path!);
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
    return ElevatedButton(
      child: const Icon(Icons.mic,color: AppColors.primaryColorDark,size: 65,),
      onPressed:()async {
        if (recorder.isRecording) {
          await stop();
        } else {
          await record();
        }
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(64.0),

        ),
        primary: AppColors.primaryColor,
      ),
    );
  }
}
