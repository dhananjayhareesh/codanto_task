import 'package:codanto_task/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDrawer extends StatelessWidget {
  final String username;

  const CommonDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    final RxInt selectedIndex = 0.obs;

    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.red,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            username.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // List items
              Obx(() => Column(
                    children: [
                      drawerItem(
                        icon: Icons.home,
                        label: 'Home',
                        onTap: () {
                          selectedIndex.value = 0;
                        },
                        isSelected: selectedIndex.value == 0,
                      ),
                      drawerItem(
                        icon: Icons.info,
                        label: 'About Us',
                        onTap: () {
                          selectedIndex.value = 1;
                        },
                        isSelected: selectedIndex.value == 1,
                      ),
                      drawerItem(
                        icon: Icons.lock,
                        label: 'Change Password',
                        onTap: () {
                          selectedIndex.value = 2;
                        },
                        isSelected: selectedIndex.value == 2,
                      ),
                      drawerItem(
                        icon: Icons.description,
                        label: 'Terms and Conditions',
                        onTap: () {
                          selectedIndex.value = 3;
                        },
                        isSelected: selectedIndex.value == 3,
                      ),
                      drawerItem(
                        icon: Icons.privacy_tip,
                        label: 'Privacy Policy',
                        onTap: () {
                          selectedIndex.value = 4;
                        },
                        isSelected: selectedIndex.value == 4,
                      ),
                    ],
                  )),

              drawerItem(
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            authController.logout();
                            Get.back();
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.2) : Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
