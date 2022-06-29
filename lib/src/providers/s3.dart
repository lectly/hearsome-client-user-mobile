import 'dart:io';

import 'package:dio/dio.dart';

class S3Provider {
  static Dio dio = Dio();

  static uploadAudio(File file, String url) async {
    var len = file.readAsBytesSync().lengthInBytes;
    var response = await dio.put(url,
        data: file.openRead(),
        options: Options(headers: {
          Headers.contentLengthHeader: len,
          Headers.contentTypeHeader: "audio/mp4",
          Headers.acceptHeader: "*/*"
        } // set content-length
            ));
    return response;
  }
}
