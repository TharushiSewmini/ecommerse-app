import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  // TextStyles
  static final TextStyle headline = GoogleFonts.poppins(
      fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black);

  static final TextStyle subHead = GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black);

  static final TextStyle largeLight = GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black);

  static final TextStyle largeLight20 = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black);

  static final TextStyle largeSemiBold20 = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey.shade500);

  static final TextStyle largeSemiBoldGrey20 = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey.shade500);

  static final TextStyle largeBold = GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black);

  static final TextStyle normal = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);

  static final TextStyle normalLight = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black);

  static final TextStyle normalLightWhite = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white);

  static final TextStyle normalLightwhite = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white);

  static final TextStyle normalRed = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red.shade400);

  static final TextStyle normalgrey = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade500);

  static final TextStyle mediumred = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.red);

  static final TextStyle medium = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black);

  static final TextStyle small = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black);

  static final TextStyle smallGrey = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade500);

  static final TextStyle extrasmallgrey = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w300, color: Colors.grey.shade600);

  static final TextStyle extrasmallwhite = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white);

  // Colors
  static const Color primaryColor = Colors.black;
  static const Color oppositeprimaryColor = Colors.white;
  static const Color secondaryColor = Color(0xff212429);
  static const Color thirdColor = Color.fromARGB(255, 228, 228, 228);
}
