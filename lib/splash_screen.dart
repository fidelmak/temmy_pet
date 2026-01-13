import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temmy_pet/view/onboarding_view/onboarding_view.dart';
import 'package:temmy_pet/widget/extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://i.pinimg.com/736x/da/07/16/da0716f9065916902e6fa70cb5d37877.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              Text(
                'Get Pet',
                style: GoogleFonts.archivoBlack(
                  fontSize: context.screenHeight / 10.sp,
                  color: Colors.yellowAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: context.screenWidth / 1.2.sp,
                child: Text(
                  textAlign: TextAlign.center,
                  'Adopt your desired pet  ',
                  style: GoogleFonts.romanesco(
                    fontSize: context.screenHeight / 20.sp,
                    color: Colors.brown,
                    letterSpacing: 2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/onboardingView');
        },
        backgroundColor: Color(0xFFa5bdbd),
        child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 14.sp),
      ),
    );
  }
}
