import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, // Increased height to accommodate overlapping icons
      color: Color(0xff005A00),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildNavItem(Icons.home, 0),
                _buildNavItem(Icons.menu, 1),
                _buildNavItem(Icons.person, 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(bottom: 13),
        // Adjust this to control overlap
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: selectedIndex == index ? Colors.green.shade800 : Colors.grey,
          size: 27,
        ),
      ),
    );
  }
}
