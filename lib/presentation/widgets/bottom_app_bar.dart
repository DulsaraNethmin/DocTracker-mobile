import 'package:flutter/material.dart';

dynamic bottomNavBar(BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.purple[600],
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white.withOpacity(.60),
    selectedFontSize: 14,
    unselectedFontSize: 14,
    onTap: (value) {
      // Respond to item press.
      switch (value) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
          Navigator.pushNamed(context, '/search');
          break;
        case 2:
          Navigator.pushNamed(context, '/qr');
          break;
        case 3:
          Navigator.pushNamed(context, '/track');
          break;
        case 1:
          Navigator.pushNamed(context, '/more');
          break;
      }
    },
    items: [
      BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home_filled),
      ),
      BottomNavigationBarItem(
        label: 'Search',
        icon: Icon(Icons.search),
      ),
      BottomNavigationBarItem(
        label: 'Scan',
        icon: Icon(Icons.qr_code_scanner),
      ),
      BottomNavigationBarItem(
        label: 'Track',
        icon: Icon(Icons.location_on),
      ),
      BottomNavigationBarItem(
        label: 'More',
        icon: Icon(Icons.more),
      ),
    ],
  );
}
