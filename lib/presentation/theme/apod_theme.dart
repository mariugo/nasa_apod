import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApodTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.openSans(
      fontSize: 18,
      color: Colors.white,
    ),
    bodyText1: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      wordSpacing: 2,
    ),
    subtitle1: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    subtitle2: GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.italic,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.openSans(
      fontSize: 18,
      color: Colors.white,
    ),
    bodyText1: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      wordSpacing: 2,
    ),
    subtitle1: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    subtitle2: GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.italic,
    ),
  );

  static light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF6002EE),
        brightness: Brightness.light,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Color(0xFF90EE02),
      ),
      textTheme: lightTextTheme,
    );
  }

  static dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF7E3FF2),
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF6002EE),
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF6002EE),
        brightness: Brightness.dark,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Color(0xFF90EE02),
      ),
      textTheme: darkTextTheme,
    );
  }
}
