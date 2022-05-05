import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:lectly_client_user_mobile/src/ui/splash/splash.dart';

class DialogButton extends StatefulWidget {
  const DialogButton({Key? key}) : super(key: key);

  @override
  State<DialogButton> createState() => _DialogButtonState();
}

class _DialogButtonState extends State<DialogButton> {
  bool english = true;
  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: AppColors.transparent,
    child: Container(
      height: 96.0,
     color: AppColors.transparent,
     child: Column(
       children: [

         Container(

           decoration: BoxDecoration(
          color: AppColors.primaryColorDark,
               borderRadius: const BorderRadius.all(Radius.circular(8.0))),
           height: 48,
     child: Row(

      children:[
        const SizedBox(width: 21.0,),
       Image.asset(
          "assets/images/american_flag.png",
        ),

       SimpleDialogOption(

          onPressed: () {
            Navigator.pop(context, "English"); },
          child: const Text('English',
         style: TextStyle(
           color: AppColors.primaryColor,
           fontFamily: "Cairo",
           fontSize: 16.0,
         ),
          ), ),
        const SizedBox(width: 120.0,),
        IconButton(
          icon: Image.asset('assets/images/arrow.png'),
          iconSize: 50,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    ]), ),
       Container(
         decoration: BoxDecoration(
             color: AppColors.primaryColor,
             borderRadius: const BorderRadius.all(Radius.circular(8.0))),
         height: 48,

       child: Row(

          children:[
            const SizedBox(width: 21.0,),
            Image.asset(
              "assets/images/egyptian_flag.png",
            ),

            SimpleDialogOption(
              onPressed: () {
               english = false;
                Navigator.pop(context, "العربية"); },
              child: const Text('العربية',
                style: TextStyle(
                  color: AppColors.primaryColorDark,
                  fontFamily: "Cairo",
                  fontSize: 16.0,
                ),

              ), ),]),),



       ],

     ),
    ),
    );
  }
}
