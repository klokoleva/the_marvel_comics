import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primarycolor = Color(0xFFC00010);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFC00010),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDAD5),
  onPrimaryContainer: Color(0xFF410002),
  secondary: Color(0xFFBF002B),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDAD9),
  onSecondaryContainer: Color(0xFF410008),
  tertiary: Color(0xFF006399),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFCDE5FF),
  onTertiaryContainer: Color(0xFF001D32),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFCFF),
  onBackground: Color(0xFF001F2A),
  surface: Color(0xFFFAFCFF),
  onSurface: Color(0xFF001F2A),
  surfaceVariant: Color(0xFFF5DDDA),
  onSurfaceVariant: Color(0xFF534341),
  outline: Color(0xFF857371),
  onInverseSurface: Color(0xFFE1F4FF),
  inverseSurface: Color(0xFF003547),
  inversePrimary: Color(0xFFFFB4AB),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFC00010),
  outlineVariant: Color(0xFFD8C2BF),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB4AB),
  onPrimary: Color(0xFF690004),
  primaryContainer: Color(0xFF930009),
  onPrimaryContainer: Color(0xFFFFDAD5),
  secondary: Color(0xFFFFB3B2),
  onSecondary: Color(0xFF680013),
  secondaryContainer: Color(0xFF92001E),
  onSecondaryContainer: Color(0xFFFFDAD9),
  tertiary: Color(0xFF95CCFF),
  onTertiary: Color(0xFF003352),
  tertiaryContainer: Color(0xFF004A75),
  onTertiaryContainer: Color(0xFFCDE5FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001F2A),
  onBackground: Color(0xFFBFE9FF),
  surface: Color(0xFF001F2A),
  onSurface: Color(0xFFBFE9FF),
  surfaceVariant: Color(0xFF534341),
  onSurfaceVariant: Color(0xFFD8C2BF),
  outline: Color(0xFFA08C8A),
  onInverseSurface: Color(0xFF001F2A),
  inverseSurface: Color(0xFFBFE9FF),
  inversePrimary: Color(0xFFC00010),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB4AB),
  outlineVariant: Color(0xFF534341),
  scrim: Color(0xFF000000),
);
TextStyle bodyStyle = GoogleFonts.marvel(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
);

TextStyle buttonStyle = GoogleFonts.marvel(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
);

TextStyle headlineStyle = GoogleFonts.marvel(
  textStyle: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
);

TextStyle titleStyle = GoogleFonts.coveredByYourGrace(
  textStyle: TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  ),
);
