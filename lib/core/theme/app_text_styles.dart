import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Fredoka - yuvarlak ve çocuk dostu
  static TextStyle displayLarge = GoogleFonts.fredoka(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreen,
  );
  
  static TextStyle heading = GoogleFonts.fredoka(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreen,
  );
  
  static TextStyle title = GoogleFonts.fredoka(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGreen,
  );
  
  static TextStyle body = GoogleFonts.fredoka(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreen,
  );
  
  static TextStyle button = GoogleFonts.fredoka(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  
  static TextStyle number = GoogleFonts.fredoka(
    fontSize: 80,
    fontWeight: FontWeight.w700,
    color: AppColors.darkGreen,
  );
}