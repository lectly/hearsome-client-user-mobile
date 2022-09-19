import '../utils/permissions.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'dart:io';

class Recorder {
  final Permissions permissions = Permissions();
  final _recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  Future record() async {
    if (!isRecorderReady) return;
    await _recorder.startRecorder(toFile: "audio.aac");
  }

  Future stop() async {
    if (!isRecorderReady) return;
    final path = await _recorder.stopRecorder();
    return File(path!);
  }

  Future<void> closeRecorder(){
    return _recorder.closeRecorder();
  }

  Future initRecorder() async {
    permissions.checkPermissions();
    await _recorder.openRecorder();
    isRecorderReady = true;
  }
}
