import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'https://i.pinimg.com/736x/bf/36/fa/bf36fabb0b3548ec6d85752f5b40e55c.jpg', // Replace with your actual URL
    'https://i.pinimg.com/736x/97/21/7e/97217e8818e89035a75bf45c6971b4b3.jpg', // Replace with your actual URL
    'https://i.pinimg.com/1200x/03/ac/0b/03ac0b61d930890157998108b18afc35.jpg', // Replace with your actual URL
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // curve starts here
          Container(
            height: screenHeight * 0.6,
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
                  width: screenWidth,
                  height: screenHeight * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(images[index]), // Image path
                      fit: BoxFit.cover,
                    ),
                  ),
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
                    width: screenWidth / 1.2,
                    child: Text(
                      firstText[_currentPage],
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize:
                            28.sp, //screenHeight / 30, // Adjusted font size
                        color: Color(0xff020202),
                        height: 1.2, // Reduced text height spacing to 1.2
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  SizedBox(
                    width: screenWidth / 1.2,
                    child: Text(
                      secondText[_currentPage],
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize:
                            14.sp, //screenHeight / 50, // Adjusted font size
                        color: Colors.black87,
                        height: 1.2, // Reduced text height spacing to 1.2
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Row(
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
                            color: _currentPage == index
                                ? Colors.black
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                      );
                    }),
                  ),

                  SizedBox(height: 10.sp),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: Size(260.sp, 48.sp),
                      backgroundColor: Colors.black, // Adjusted button size

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          5.r,
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
                  ),

                  SizedBox(height: 7.sp),
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
