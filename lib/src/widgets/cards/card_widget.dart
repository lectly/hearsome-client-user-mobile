import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';

class CardContainer extends FractionallySizedBox {
  CardContainer({Key? key, required String text})
      : super(
          key: key,
          widthFactor: 1,
          heightFactor: 0.95,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 34, vertical: 80),
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0.0, 4.0))
                ]),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: AppColors.primaryColorDark,
                      height: 1.5,
                      fontFamily: "Cairo",
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
