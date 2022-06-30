import 'package:get/get.dart';
import 'dart:io';
import 'package:lectly_client_user_mobile/src/providers/main.dart';
import '../providers/s3.dart';

class MainController extends GetxController {
  final MainProvider _mainProvider = MainProvider();
  final RxString transcription = "".obs;
  final RxInt screenIdx = 0.obs;

  transcribe(File file) async {
    // Loading state
    setTranscription("");
    setScreenIdx(1);

    //  GET SIGNED S3 URL
    var response = await _mainProvider.getSignedUrl();
    if (response == null) return;
    // TODO: when transcribe endpoint is done
    // final String signedURL = response['signedURL'];
    // final String objectName = response['objectName'];
    // final String bucketName = response['bucketName'];

    // UPLOAD AUDIO TO S3
    // S3Provider.uploadAudio(file, signedURL);
    // final String objectURL =
    //     'https://' + bucketName + '.s3.amazonaws.com/' + objectName;

    //  TRANSCRIBE AUDIO: DEBUG ENDPOINT
    response = await _mainProvider.transcribe();
    if (response['result'].toString().isNotEmpty) {
      // Loading state
      setTranscription(response['result']);
      setScreenIdx(2);
    } else {
      // Error state
      setScreenIdx(0);
    }
  }

  setTranscription(String value) {
    transcription.value = value;
    update();
  }

  setScreenIdx(int value) {
    if (value > 2 || value < 0) screenIdx.value = 0;
    screenIdx.value = value;
    update();
  }
}
