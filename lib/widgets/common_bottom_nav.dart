import 'package:flutter/material.dart';

class CommonBottomNav extends StatefulWidget {
  const CommonBottomNav({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CommonBottomNavState createState() => _CommonBottomNavState();
}

class _CommonBottomNavState extends State<CommonBottomNav> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.chat_bubble_outline, 'Chat', 0),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.people_outline, 'Members', 1),
          label: 'Members',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.home, 'Home', 2),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.layers_outlined, 'Resources', 3),
          label: 'Resources',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.image_outlined, 'Gallery', 4),
          label: 'Gallery',
        ),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _currentIndex == index;

    return Container(
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      padding: isSelected ? const EdgeInsets.all(8.0) : const EdgeInsets.all(0),
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }
}
