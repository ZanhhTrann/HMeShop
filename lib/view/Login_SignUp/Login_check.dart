import 'package:get/get.dart';

import '../../controller/Controller.dart';
import '../profile/proflie.dart';

bool LoginCheck({String? eMail, String? pw}) {
  final controller = Get.find<Controller>();
  for (int i = 0; i < controller.Account.length; i++) {
    if (controller.Account[i].email == eMail!) {
      if (controller.Account[i].pass == pw) {
        controller.setProfile(profile(Account: controller.Account[i]));
        Get.snackbar(
          'Success',
          'To Login!',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
        return true;
      } else {
        Get.snackbar(
          'False',
          'Incorrect password!',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
        return false;
      }
    }
  }

  Get.snackbar(
    'False',
    'Email does not exist!',
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 3),
  );
  return false;
}
