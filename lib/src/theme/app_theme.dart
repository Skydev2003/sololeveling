import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData dark() {
    final base = ThemeData.dark();
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: const Color(0xFF6D28D9), // indigo/purple
        secondary: const Color(0xFF7C3AED),
        background: const Color(0xFF0B0217),
        surface: const Color(0xFF12081A),
      ),
      scaffoldBackgroundColor: const Color(0xFF0B0217),
      textTheme: GoogleFonts.kanitTextTheme(
        base.textTheme,
      ).apply(bodyColor: Colors.white, displayColor: Colors.white),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF12081A),
        elevation: 2,
      ),
      cardColor: const Color(0xFF141021),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7C3AED),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // provide a light fallback though default is dark
  static ThemeData light() {
    final base = ThemeData.light();
    return base.copyWith(textTheme: GoogleFonts.kanitTextTheme(base.textTheme));
  }
}
