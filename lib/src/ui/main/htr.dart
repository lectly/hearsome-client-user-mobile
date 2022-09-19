import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import '../../widgets/buttons/record_button_widget.dart';

class HoldToRecordScreen extends StatelessWidget {
  const HoldToRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Text(
              "hold".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontFamily: "Cairo",
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const RecordButton(),
          ],
        ));
  }
}
