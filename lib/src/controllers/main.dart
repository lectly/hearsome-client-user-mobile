import 'package:get/get.dart';
import 'dart:io';
import 'package:lectly_client_user_mobile/src/providers/main.dart';
import '../providers/s3.dart';

class MainController extends GetxController {
  final MainProvider _mainProvider = MainProvider();
  final RxString transcription = "".obs;
  final RxBool isLoading = false.obs;

  transcribe(File file) async {
    isLoading.value = true;
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
    transcription.value = response['result'];
    transcription.refresh();
  }

  setLoading() {
    transcription.value = "";
    isLoading.value = true;
  }
}
