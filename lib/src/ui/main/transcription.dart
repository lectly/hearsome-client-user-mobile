import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lectly_client_user_mobile/src/controllers/main.dart';
import 'package:lectly_client_user_mobile/src/widgets/cards/card_widget.dart';

class TranscriptionScreen extends StatelessWidget {
  final MainController _controller = Get.find();
  TranscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardContainer(text: _controller.transcription.value);
  }
}
