import 'dart:io';
import 'package:dio/dio.dart';
class PutRequest{
  Future<Response> request(String url, File file) async {
    Dio dio = new Dio();
    var len = await file.readAsBytesSync().lengthInBytes;
    print(len);
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