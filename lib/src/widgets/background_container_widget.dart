import 'package:flutter/material.dart';

class BackgroundContainer extends Container {
   BackgroundContainer({required Widget child}) : super(
    child:child ,
    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(
      gradient:LinearGradient(
        colors: [
          Color(0xFF5632D0),
          Color(0x995632D0),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  );

}

