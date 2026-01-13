import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temmy_pet/widget/extension.dart';

ElevatedButton customButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize:
          Size(context.screenWidth / 1.3.sp, context.screenHeight / 14.sp),
      backgroundColor: Colors.black, // Adjusted button size

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          24.r,
        ), // Radius applied
      ),
    ),
    child: Text(
      "Get Started",
      style: GoogleFonts.poppins(
        color: Colors.white,

        fontWeight: FontWeight.w600,
        fontSize: 16.sp, // Adjusted font size
      ),
    ),
  );
}
