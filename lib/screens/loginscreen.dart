import 'package:codanto_task/constants/media_query.dart';
import 'package:codanto_task/constants/text_strings.dart';
import 'package:codanto_task/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.put(AuthController());
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQueryUtils.getHeight(context);
    final width = MediaQueryUtils.getWidth(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            logoContainer(height, width),
            SizedBox(height: height * 0.05),
            mainLoginSection(width, context, height),
          ],
        ),
      ),
    );
  }

  Padding mainLoginSection(double width, BuildContext context, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loginText(context),
          SizedBox(height: height * 0.02),
          userNameText(context),
          SizedBox(height: height * 0.0010),
          _buildTextField(
            hintText: TextStrings.enterUsername,
            onChanged: (value) => authController.username.value = value,
          ),
          SizedBox(height: height * 0.02),
          passText(context),
          SizedBox(height: height * 0.0010),
          _buildTextField(
            hintText: TextStrings.enterPassword,
            obscureText: _obscurePassword,
            onChanged: (value) => authController.password.value = value,
            isPasswordField: true,
            togglePasswordVisibility: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          forgotPass(context),
          SizedBox(height: height * 0.02),
          loginButton(height, context),
        ],
      ),
    );
  }

  SizedBox loginButton(double height, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent.shade100, Colors.red],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          onPressed: () {
            authController.login(
              authController.username.value,
              authController.password.value,
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: height * 0.015),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.black.withOpacity(0.2),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            TextStrings.loginButton,
            style: TextStyles.loginButton(context),
          ),
        ),
      ),
    );
  }

  Align forgotPass(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          TextStrings.forgotPassword,
          style: TextStyles.forgotPassword(context),
        ),
      ),
    );
  }

  Text passText(BuildContext context) {
    return Text(
      TextStrings.password,
      style: TextStyles.label(context),
    );
  }

  Text userNameText(BuildContext context) {
    return Text(
      TextStrings.usernameOrId,
      style: TextStyles.label(context),
    );
  }

  Center loginText(BuildContext context) {
    return Center(
      child: Text(
        TextStrings.login,
        style: TextStyles.loginTitle(context),
      ),
    );
  }

  Container logoContainer(double height, double width) {
    return Container(
      width: double.infinity,
      height: height * 0.45,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.redAccent.shade100, Colors.red],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/logo.png',
          width: width * 0.50,
          height: height * 0.25,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    bool obscureText = false,
    required Function(String) onChanged,
    bool isPasswordField = false,
    VoidCallback? togglePasswordVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
          ),
          suffixIcon: isPasswordField
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: togglePasswordVisibility,
                )
              : null,
        ),
      ),
    );
  }
}
