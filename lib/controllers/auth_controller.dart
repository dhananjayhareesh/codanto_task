import 'package:codanto_task/screens/homescreens/admin_homescreen.dart';
import 'package:codanto_task/screens/homescreens/member_homescreen.dart';
import 'package:codanto_task/screens/homescreens/president_homescreen.dart';
import 'package:codanto_task/screens/loginscreen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isAuthenticated = false.obs;

  // Mock API call to authenticate
  Future<void> login(String usernameInput, String passwordInput) async {
    if (passwordInput == '1234') {
      if (usernameInput == 'admin' ||
          usernameInput == 'member' ||
          usernameInput == 'president') {
        username.value = usernameInput;
        isAuthenticated.value = true;
        navigateToHome(usernameInput); // Navigate to respective Home screen
      } else {
        Get.snackbar('Login Failed', 'Invalid username');
      }
    } else {
      Get.snackbar('Login Failed', 'Invalid password');
    }
  }

  void navigateToHome(String role) {
    if (role == 'admin') {
      Get.offAll(AdminHome());
    } else if (role == 'member') {
      Get.offAll(MemberHome());
    } else if (role == 'president') {
      Get.offAll(PresidentHome());
    }
  }

  void logout() {
    isAuthenticated.value = false;
    Get.offAll(LoginScreen());
  }
}
