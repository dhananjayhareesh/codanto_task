import 'package:codanto_task/controllers/auth_controller.dart';
import 'package:codanto_task/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Codanto Taks',
        home: //LoginScreen(),
            SplashScreen());
  }
}
