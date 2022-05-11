import 'package:flutter/material.dart';
import '../constants/colors.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({Key? key}) : super(key: key);

// FIXME: BAD IMPLEMENTATION, NEEDS REWORK
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(children: [
      Container(
        decoration: const BoxDecoration(
            color: AppColors.primaryColorDark,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        height: 48,
        child: Row(children: [
          const SizedBox(
            width: 21.0,
          ),
          Image.asset(
            "assets/images/american_flag.png",
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "English");
            },
            child: const Text(
              'English',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontFamily: "Cairo",
                fontSize: 16.0,
              ),
            ),
          ),
          IconButton(
            icon: Image.asset('assets/images/arrow.png'),
            iconSize: 50,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    ]);
  }
}
//
// class _DialogButtonState extends State<DialogButton> {
//   bool english = true;
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: AppColors.transparent,
//       child: Container(
//         height: 96.0,
//         color: AppColors.transparent,
//         child: Column(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                   color: AppColors.primaryColorDark,
//                   borderRadius: BorderRadius.all(Radius.circular(8.0))),
//               height: 48,
//               child: Row(children: [
//                 const SizedBox(
//                   width: 21.0,
//                 ),
//                 Image.asset(
//                   "assets/images/american_flag.png",
//                 ),
//                 SimpleDialogOption(
//                   onPressed: () {
//                     Navigator.pop(context, "English");
//                   },
//                   child: const Text(
//                     'English',
//                     style: TextStyle(
//                       color: AppColors.primaryColor,
//                       fontFamily: "Cairo",
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 120.0,
//                 ),
//                 IconButton(
//                   icon: Image.asset('assets/images/arrow.png'),
//                   iconSize: 50,
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ]),
//             ),
//             Container(
//               decoration: const BoxDecoration(
//                   color: AppColors.primaryColor,
//                   borderRadius: BorderRadius.all(Radius.circular(8.0))),
//               height: 48,
//               child: Row(children: [
//                 const SizedBox(
//                   width: 21.0,
//                 ),
//                 Image.asset(
//                   "assets/images/egyptian_flag.png",
//                 ),
//                 SimpleDialogOption(
//                   onPressed: () {
//                     english = false;
//                     Navigator.pop(context, "العربية");
//                   },
//                   child: const Text(
//                     'العربية',
//                     style: TextStyle(
//                       color: AppColors.primaryColorDark,
//                       fontFamily: "Cairo",
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
