import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Trang chủ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: "Kho từ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: "Hoạt động",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Thành viên",
        ),
      ],
    );
  }
}
