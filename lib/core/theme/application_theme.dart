import 'package:flutter/material.dart';

class ApplicationTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff121312),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff282A28),
      elevation: 6,
      selectedIconTheme: IconThemeData(
        color: Color(0xffFFB224),
        size: 25,
      ),
      selectedItemColor: Color(0xffFFB224),
      selectedLabelStyle: TextStyle(
        color: Color(0xffFFB224),
        fontSize: 8,
        fontWeight: FontWeight.w400,
        height: 2,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffC6C6C6),
        size: 25,
      ),
      unselectedItemColor: Color(0xffC6C6C6),
      unselectedLabelStyle: TextStyle(
        color: Color(0xffC6C6C6),
        fontSize: 8,
        fontWeight: FontWeight.w400,
        height: 2,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}
