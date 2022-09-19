import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HeaderInterceptors extends Interceptor {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> getUserToken() async {
    final User? user = auth.currentUser;
    final String? token = await user?.getIdToken();
    return token;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await getUserToken();
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['language'] = 'en';
    options.headers['platform'] = 'ios';
    options.headers["app-version"] = "1";
    return super.onRequest(options, handler);
  }
}
