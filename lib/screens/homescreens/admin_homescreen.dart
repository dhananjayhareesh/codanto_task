import 'package:codanto_task/controllers/auth_controller.dart';
import 'package:codanto_task/widgets/common_appbar.dart';
import 'package:codanto_task/widgets/common_bottom_nav.dart';
import 'package:codanto_task/widgets/common_drawer.dart';
import 'package:codanto_task/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHome extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  AdminHome({super.key});

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
            title: 'Manage Club',
            iconPath: 'assets/club.png',
            onTap: () {},
          ),
          DashboardCard(
            title: 'Manage Members',
            iconPath: 'assets/team.png',
            onTap: () {},
          ),
          DashboardCard(
            title: 'Manage Gallery',
            iconPath: 'assets/gallery.png',
            onTap: () {},
          ),
          DashboardCard(
            title: 'Manage Resources',
            iconPath: 'assets/layers.png',
            onTap: () {},
          ),
          DashboardCard(
            title: 'Manage Report',
            iconPath: 'assets/report.png',
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
