import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class Request {
  String? stringResponse;

  List? listResponse;
  Map? mapResponse;
  List? listOfFacts;

  //It works but waiting for backend deploy
  Future fetchData() async {
    http.Response response;
    response =
    await http.get(Uri.parse('https://thegrowingdeveloper.org/apiview?id=2'));
    if (response.statusCode == 200) {
      //if our call is successful
        mapResponse = jsonDecode(response.body);
        listOfFacts = mapResponse?['facts'];
        print('the response ${mapResponse?['category'].toString()}');
    }
  }


  //to be completed waiting for backend to deploy
  Future<Response> sendFile(String url, File file) async {

    Dio dio = new Dio();
    var len = await file.readAsBytesSync().lengthInBytes;
    var response = await dio.put(url,
        data: file.openRead(),
        options: Options(headers: {
          Headers.contentLengthHeader: len,
        } // set content-length
        ));
    return response;
  }


}

