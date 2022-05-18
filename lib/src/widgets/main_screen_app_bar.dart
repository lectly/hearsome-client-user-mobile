import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/widgets/horizontal_logo_widget.dart';
import '../constants/colors.dart';



class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: const HorizontalLogo(),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/language.png'),
            iconSize: 50,
            onPressed: () {

            },
          ),
        ],
        leading:
            IconButton(
              icon: Image.asset('assets/images/user.png'),
              // iconSize: 50,
              onPressed: () {
              },
            ),
    );
  }
}
