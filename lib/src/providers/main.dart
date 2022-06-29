import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lectly_client_user_mobile/src/interceptors/header.dart';

class MainProvider {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://api.hearsome.live/v1/user"));

  MainProvider() {
    _dio.interceptors.add(HeaderInterceptors());
  }

  Future<dynamic> getSignedUrl() async {
    Response response = await _dio.get("/signed_url");
    return response.data;
  }

  Future<dynamic> transcribe() async {
    Response response = await _dio.get("/transcribe");
    return response.data;
  }
}
