import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lectly_client_user_mobile/src/ui/splash/splash.dart';

import 'package:lectly_client_user_mobile/src/ui/profile.dart';
import 'package:lectly_client_user_mobile/src/ui/no_internet/no_internet.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/app_bar_widget.dart';



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


      home: const ProfileScreen(),

    );
  }
}
