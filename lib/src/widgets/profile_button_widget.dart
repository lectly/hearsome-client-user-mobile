import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/profile/profile.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/user.png'),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
      },
    );
  }
}
