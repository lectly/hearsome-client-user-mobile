import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/widgets/dialog_button_widget.dart';
import '../constants/colors.dart';
import 'package:lectly_client_user_mobile/src/ui/splash/splash.dart';

class Appbar extends StatefulWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    const SizedBox(height: 10.0,);
    return Container(
      color: AppColors.transparent,
      height: 64,
      width: width,
      alignment: Alignment.center,

      child: Row(
        children: [
          IconButton(
            icon: Image.asset('assets/images/back.png'),
            iconSize: 50,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SplashScreen()));
            },
          ),
          const SizedBox(width: 98.0,),
           Text(
            "Profile",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontFamily: "Cairo",
              fontSize: 24.0,
            ),
          ),
          const SizedBox(width: 97.0,),
          IconButton(
            icon: Image.asset('assets/images/globe.png'),
            iconSize: 50,
            onPressed: () {
              showDialog(context: context, builder: (BuildContext context){
                return DialogButton();
              });
            },
          ),

        ],
      ),
    );
  }
}
