import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';

import '../home/homepage.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

   @override
   void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(const Duration(seconds: 5), (){
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const homePage()));
  //  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                ),
                const Text("hearsome",textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Cairo",
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),

            const CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}

