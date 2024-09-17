// lib/screens/login_screen.dart
import 'package:codanto_task/constants/media_query.dart';
import 'package:codanto_task/constants/text_strings.dart';
import 'package:codanto_task/constants/text_style.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQueryUtils.getHeight(context);
    final width = MediaQueryUtils.getWidth(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo Section
            Container(
              width: double.infinity,
              height: height * 0.45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent.shade100, Colors.red],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/logo.png', // Path to your logo image
                  width: width *
                      0.50, // Adjust the logo size based on screen width
                  height: height * 0.25, // Adjust the logo height
                ),
              ),
            ),

            SizedBox(height: height * 0.05), // Responsive spacing

            // Login Section
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.07), // 7% of screen width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Login Text
                  Center(
                    child: Text(
                      TextStrings.login,
                      style: TextStyles.loginTitle(context),
                    ),
                  ),
                  SizedBox(height: height * 0.02), // Responsive spacing

                  // Username/ Membership ID Label
                  Text(
                    TextStrings.usernameOrId,
                    style: TextStyles.label(context),
                  ),
                  SizedBox(height: height * 0.0010), // Responsive spacing

                  // Username/ Membership ID TextField
                  _buildTextField(
                    hintText: TextStrings.enterUsername,
                  ),

                  SizedBox(height: height * 0.02), // Responsive spacing

                  // Password Label
                  Text(
                    TextStrings.password,
                    style: TextStyles.label(context),
                  ),
                  SizedBox(height: height * 0.0010), // Responsive spacing

                  // Password TextField
                  _buildTextField(
                    hintText: TextStrings.enterPassword,
                  ),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Forgot password functionality
                      },
                      child: Text(
                        TextStrings.forgotPassword,
                        style: TextStyles.forgotPassword(context),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02), // Responsive spacing

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.redAccent.shade100,
                            Colors.red
                          ], // Gradient colors
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Login button functionality
                        },
                        style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.015),
                          backgroundColor: Colors
                              .transparent, // Set to transparent to show gradient background
                          shadowColor: Colors.black.withOpacity(
                              0.2), // Shadow color for the 3D effect
                          elevation:
                              4, // Reduced elevation for a subtler 3D effect
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                        ),
                        child: Text(
                          TextStrings.loginButton,
                          style: TextStyles.loginButton(context),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable TextField widget
  Widget _buildTextField({required String hintText}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 5), // Vertical padding for the TextField
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.symmetric(
              horizontal: 15), // Horizontal padding inside the TextField
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // Set the corner radius here
            borderSide: BorderSide.none, // No border line
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // Set the corner radius here
            borderSide: BorderSide.none, // No border line
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // Set the corner radius here
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1.5, // Optional: Change the color when focused
            ),
          ),
        ),
      ),
    );
  }
}
