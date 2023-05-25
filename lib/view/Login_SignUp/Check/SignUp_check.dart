import 'package:get/get.dart';

bool SignUpCheck({String? email, String? name, String? pw, String? rpw}) {
  if (name == '' || email == '' || pw == '' || rpw == '') {
    Get.snackbar(
      'False',
      'Do not accept null value!',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
    return false;
  } else {
    if (email!.contains('@gmail.com')) {
      if (pw == rpw) {
        Get.snackbar(
          'Success',
          'Account has been added!',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
        return true;
      } else {
        Get.snackbar(
          'False',
          'Retype Password is incorrect!',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
        return false;
      }
    } else {
      Get.snackbar(
        'False',
        'Invalid email (example@gmail.com)!',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );
      return false;
    }
  }
}
