import 'dart:io';
import 'package:dio/dio.dart';

class PutRequest {
  Future<Response> request(String url, File file) async {

    Dio dio = Dio();
    var len = file.readAsBytesSync().lengthInBytes;

    var response = await dio.put(url,
        data: file.openRead(),
        options: Options(headers: {
          Headers.contentLengthHeader: len,
          Headers.contentTypeHeader: "audio/mp4",
          Headers.acceptHeader: "*/*"
        } // set content-length
            ));
    print(response.statusMessage);
    return response;
  }
}
