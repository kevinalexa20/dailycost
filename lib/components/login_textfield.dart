import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/color_app.dart';

class LoginTextField extends StatelessWidget {
  final contoller;
  final String hintText;
  final obscureText;

  const LoginTextField({
    super.key,
    required this.contoller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: contoller,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: ColorApp.white,
        filled: true,
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ColorApp.darkPurple100,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorApp.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorApp.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorApp.darkPurple600,
          ),
        ),
      ),
    );
  }
}
