import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row dashLine(images, _pageController, int _currentPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(images.length, (index) {
      return GestureDetector(
        onTap: () {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          width: _currentPage == index ? 30.sp : 10.sp,
          height: 5.sp,
          margin: EdgeInsets.symmetric(horizontal: 5.sp),
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.black : Colors.grey,
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
      );
    }),
  );
}
