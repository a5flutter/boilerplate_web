import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:side_navigation/side_navigation.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static SideNavigationBarItemTheme lightSideNavBar = SideNavigationBarItemTheme(
    unselectedItemColor: Colors.black87,
    labelTextStyle: GoogleFonts.openSans(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )
  );

  static SideNavigationBarItemTheme darkSideNavBar = SideNavigationBarItemTheme(
      unselectedItemColor: Colors.white,
      labelTextStyle: GoogleFonts.openSans(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      backgroundColor: Color(0xFFB3B3B6),
      primaryColor: Color(0xFF2697FF),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Color(0xFFB3B3B6),
      primaryColor: Color(0xFF2697FF),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black87,
      ),
      textTheme: darkTextTheme,
    );
  }
}