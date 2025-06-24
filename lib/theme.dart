import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: const Color(0xFF007AFF),
        secondary: const Color(0xFF5856D6),
        tertiary: const Color(0xFF34C759),
        surface: const Color(0xFFFAFAFA),
        error: const Color(0xFFFF3B30),
        onPrimary: const Color(0xFFFFFFFF),
        onSecondary: const Color(0xFFFFFFFF),
        onTertiary: const Color(0xFFFFFFFF),
        onSurface: const Color(0xFF1C1C1E),
        onError: const Color(0xFFFFFFFF),
        outline: const Color(0xFFD1D1D6),
        surfaceVariant: const Color(0xFFF2F2F7),
        onSurfaceVariant: const Color(0xFF8E8E93),
      ),
      brightness: Brightness.light,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 57.0,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 45.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: 36.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.1,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.1,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.2,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.1,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 17.0,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.4,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.2,
          height: 1.4,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 13.0,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.1,
          height: 1.3,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color(0xFFFFFFFF),
      ),
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFF0A84FF),
        secondary: const Color(0xFF5E5CE6),
        tertiary: const Color(0xFF30D158),
        surface: const Color(0xFF1C1C1E),
        error: const Color(0xFFFF453A),
        onPrimary: const Color(0xFFFFFFFF),
        onSecondary: const Color(0xFFFFFFFF),
        onTertiary: const Color(0xFF000000),
        onSurface: const Color(0xFFFFFFFF),
        onError: const Color(0xFFFFFFFF),
        outline: const Color(0xFF38383A),
        surfaceVariant: const Color(0xFF2C2C2E),
        onSurfaceVariant: const Color(0xFF8E8E93),
      ),
      brightness: Brightness.dark,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 57.0,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 45.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: 36.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.1,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.1,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.2,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.1,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 17.0,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.4,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.2,
          height: 1.4,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 13.0,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.1,
          height: 1.3,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color(0xFF2C2C2E),
      ),
    );