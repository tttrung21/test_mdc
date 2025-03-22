import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_mdc/core/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle roboto = GoogleFonts.roboto(height: 0);
  static TextStyle title = roboto.copyWith(fontSize: 17, fontWeight: FontWeight.w400);
  static TextStyle header = roboto.copyWith(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.black);
  static TextStyle subheader = roboto.copyWith(fontSize: 17, fontWeight: FontWeight.w400);
  static TextStyle title1 = roboto.copyWith(fontSize: 15, fontWeight: FontWeight.w400);
  static TextStyle title2 = roboto.copyWith(fontSize: 13, fontWeight: FontWeight.w400);
  static TextStyle button = roboto.copyWith(fontSize: 15, fontWeight: FontWeight.w700);
}
