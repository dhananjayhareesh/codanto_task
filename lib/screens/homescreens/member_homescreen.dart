import 'package:codanto_task/controllers/auth_controller.dart';
import 'package:codanto_task/widgets/common_appbar.dart';
import 'package:codanto_task/widgets/common_bottom_nav.dart';
import 'package:codanto_task/widgets/common_drawer.dart';
import 'package:codanto_task/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberHome extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  MemberHome({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        username: authController.username.value,
      ),
      drawer: CommonDrawer(username: authController.username.value),
      bottomNavigationBar: const CommonBottomNav(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dashText(),
            SizedBox(height: height * 0.02),

            // Dashboard Grid
            dashCard(width, height),
          ],
        ),
      ),
    );
  }

  Expanded dashCard(double width, double height) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: width / (height / 2.5),
        children: [
          DashboardCard(
            title: 'CHAT',
            iconPath: 'assets/chat.png',
            onTap: () {},
          ),
          DashboardCard(
            title: 'MEMBERS',
            iconPath: 'assets/team.png',
            onTap: () {},
          ),
          DashboardCard(
            title: 'RESOURCES',
            iconPath: 'assets/layers.png',
            onTap: () {},
          ),
          DashboardCard(
            title: 'GALLERY',
            iconPath: 'assets/gallery.png',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Padding dashText() {
    return const Padding(
      padding: EdgeInsets.only(left: 25),
      child: Text(
        'Dashboard',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
