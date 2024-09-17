import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var role = ''.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 2)); // Simulate API delay

    // Mock login based on username and password
    if (username == 'admin' && password == '12345') {
      role.value = 'admin';
    } else if (username == 'member' && password == '12345') {
      role.value = 'member';
    } else if (username == 'president' && password == '12345') {
      role.value = 'president';
    } else {
      Get.snackbar('Error', 'Invalid credentials');
    }

    isLoading.value = false;

    // Navigate to respective home if login is successful
    if (role.isNotEmpty) {
      navigateToHome();
    }
  }

  void navigateToHome() {
    if (role.value == 'admin') {
      Get.offAllNamed('/adminHome');
    } else if (role.value == 'member') {
      Get.offAllNamed('/memberHome');
    } else if (role.value == 'president') {
      Get.offAllNamed('/presidentHome');
    }
  }
}
