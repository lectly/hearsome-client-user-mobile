import 'dart:async';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class Permissions {
  CheckPermissions() async {

      if (!(await Permission.microphone.request().isGranted)) {
        return;
      }else if (await Permission.microphone.isPermanentlyDenied) {
        openAppSettings();
      }else
        Map<Permission, PermissionStatus> statuses = await [
          Permission.microphone,
        ].request();

}
}