import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temmy_pet/widget/button.dart';
import 'package:temmy_pet/widget/dash_lne.dart';
import 'package:temmy_pet/widget/extension.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool isLoading = false;

  final List<String> images = [
    'https://i.pinimg.com/736x/bf/36/fa/bf36fabb0b3548ec6d85752f5b40e55c.jpg', // Replace with your actual URL
    'https://i.pinimg.com/1200x/62/78/62/627862bbe2b8c11fe130225ff5414b04.jpg', // Replace with your actual URL
    'https://i.pinimg.com/1200x/a5/ec/84/a5ec84facaf0a002cf7093c56ad17e55.jpg', // Replace with your actual URL
  ];

  final List<String> firstText = [
    "Adopt your desired Dog",
    "Pretty Cats available",
    "Birds of various kinds",
  ];

  final List<String> secondText = [
    "Find and adopt your perfect canine companion from our loving dogs.",
    "Discover adorable cats looking for a forever home.",
    "Explore a variety of birds ready to bring joy to your life.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // curve starts here
          Container(
            height: context.screenHeight * 0.6,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  width: context.screenWidth,
                  height: context.screenHeight * 0.6,
                  decoration: BoxDecoration(
                    image: isLoading
                        ? null
                        : DecorationImage(
                            image: NetworkImage(images[index]),
                            fit: BoxFit.cover,
                            onError: (error, stackTrace) {
                              // Handle error silently or log it
                              print('Error loading image: $error');
                            },
                          ),
                    color: isLoading ? Colors.grey[300] : null,
                  ),
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : null,
                );
              },
            ),
          ),
          // curve ends here,

          // the slider text starta here
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 8.sp,
                left: 8.sp,
                right: 8.0.sp,
              ), //EdgeInsets.all(8.0.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.screenWidth / 1.2,
                    child: Text(
                      firstText[_currentPage],
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize:
                            context.screenHeight / 30.sp, // Adjusted font size
                        color: Color(0xff020202),
                        height: 1.2, // Reduced text height spacing to 1.2
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  SizedBox(
                    width: context.screenWidth / 1.2,
                    child: Text(
                      secondText[_currentPage],
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w200,
                        fontSize:
                            context.screenHeight / 50.sp, // Adjusted font size
                        color: Colors.black87,
                        height: 1.2, // Reduced text height spacing to 1.2
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  customButton(context),
                  SizedBox(height: 50.sp),
                  dashLine(images, _pageController, _currentPage),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for the curved bottom
/// this controls the curve of the bottom
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width,

      /// 2,
      size.height, // + 30,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
