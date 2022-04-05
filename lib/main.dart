import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lectly_client_user_mobile/src/ui/splash/splash.dart';
import 'package:lectly_client_user_mobile/src/ui/profileScreen.dart';
import 'package:lectly_client_user_mobile/src/ui/NoInternetScreen.dart';
import 'package:lectly_client_user_mobile/src/ui/splash/splash.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),


      home: const SplashScreen(),



    );
  }

}

