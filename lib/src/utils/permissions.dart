import 'package:permission_handler/permission_handler.dart';

class Permissions {
  checkPermissions() async {
    if (!(await Permission.microphone.request().isGranted)) {
      return;
    } else if (await Permission.microphone.isPermanentlyDenied) {
      openAppSettings();
    } else {
      await [
        Permission.microphone,
      ].request();
    }
  }
}
