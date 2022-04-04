import 'package:flutter/material.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);


  @override
  State<NoInternetScreen > createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen > {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No Internet"),
    );
  }
}
