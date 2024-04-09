import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color baseColor = Colors.white;
  static Color primaryColor = const Color.fromARGB(255, 248, 245, 245);
  static Color callToActionColor = const Color.fromARGB(255, 10, 102, 194);
}

class AppTextStyles {
  static TextStyle montserratSmall(
      {Color color = Colors.black,
      fontSize = 12,
      fontWeight = FontWeight.normal}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle montserratMedium(
      {Color color = Colors.black,
      fontSize = 16,
      fontWeight = FontWeight.normal}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle montserratLarge(
      {Color color = Colors.black,
      fontSize = 36,
      fontWeight = FontWeight.normal}) {
    return GoogleFonts.montserrat(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }
}
