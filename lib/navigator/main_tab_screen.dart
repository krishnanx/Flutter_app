import 'package:flutter/material.dart';
import 'package:flutter_task/screens/home_screen.dart';
import 'package:flutter_task/screens/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [HomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: SafeArea(
        bottom: false,
        child: CurvedBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40), // Adjust radius as needed
        ),
        onPressed: () {},
        child: Icon(Icons.restaurant_menu, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// Custom Curved Bottom Navigation Bar
class CurvedBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CurvedBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: BottomBarClipper(),
          child: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: BottomAppBar(
              color: Colors.white,
              elevation: 10,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: _buildNavItem("Home", 0)),
                  Expanded(child: _buildNavItem("Search", 1)),
                  SizedBox(width: 60), // Space for FAB
                  Expanded(child: _buildNavItem("bell", 2)),
                  Expanded(child: _buildNavItem("profile", 3)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String icon, int index) {
    bool isSelected = index == currentIndex;

    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/$icon.svg',
        width: 60, // Adjusted size
        height: 60,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.teal : Colors.grey,
          BlendMode.srcIn,
        ),
      ),
      onPressed: () => onTap(index),
    );
  }
}

class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double fabRadius = 38;

    Path path = Path();

    // Start from left
    path.moveTo(0, 0);

    // Line to the start of curve
    path.lineTo(width * 0.35, 0);

    // Curve down and up for FAB
    path.quadraticBezierTo(
      width * 0.5,
      fabRadius * 2, // depth of the curve
      width * 0.65,
      0,
    );

    // Continue straight to right
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
