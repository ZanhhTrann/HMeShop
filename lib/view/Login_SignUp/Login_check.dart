import 'package:get/get.dart';

import '../../controller/Controller.dart';
import '../profile/proflie.dart';
// thứ tự kiểm tra log in
// kiểm tra xem có trường thông tin nào null hay không
// -kiểm tra xem email có tồn tại hay không
// -kiểm tra xem mật khẩu có đúng hay không

bool LoginCheck({String? eMail, String? pw}) {
  final controller = Get.find<Controller>();
  if (eMail == '' || pw == '') {
    Get.snackbar(
      'false',
      'Do not accept null value!',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
    return true;
  } else {
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
  }

  Get.snackbar(
    'False',
    'Email does not exist!',
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 3),
  );
  return false;
}
