import 'package:flutter/material.dart';
import 'package:medikan/screens/First_aid/first_aid_screen.dart';
import 'package:medikan/screens/authenticate_screens/login.dart';
import 'package:medikan/screens/authenticate_screens/signup_screen.dart';
import '../../themes/theme_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medikan/models/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  PageController _controller = PageController();
  final List<PageOnBoard> contents = pageOnboard;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * .04, right: size.width * .02),
            child: Align(
              alignment: Alignment.topRight,
              child: currentIndex == contents.length - 1
                  ? null
                  : TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: ColorData.primaryVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 700),
                            transitionsBuilder:
                                (context, animation, animationTime, child) {
                              animation = CurvedAnimation(
                                  parent: animation, curve: Curves.ease);
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            pageBuilder: (context, animation, animationTime) {
                              return SignUpScreen();
                            }),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 20,
                          color: ColorData.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: currentIndex == contents.length - 1
                      ? EdgeInsets.only(top: size.height * 0.08)
                      : EdgeInsets.only(top: size.height * .01),
                  child: Column(
                    children: [
                      SvgPicture.asset(contents[i].image),
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //     top: size.height * .03,
                      //     bottom: size.height * .03,
                      //     left: size.height * .02,
                      //     right: size.height * .02,
                      //   ),
                      //   child: Text(
                      //     contents[i].title,
                      //     style: const TextStyle(
                      //       fontSize: 30,
                      //       letterSpacing: 0,
                      //       fontWeight: FontWeight.bold,
                      //       color: ColorData.primaryVariant,
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.03,
                            horizontal: size.height * 0.02),
                        child: Center(
                          child: Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              color: ColorData.primaryVariant,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.height * .02),
                        child: Text(
                          contents[i].content,
                          style: FontStyleData.Paragraph_Regular_20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * .01,
              bottom: size.height * .01,
            ),
            child: currentIndex == contents.length - 1
                ? ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 700),
                          transitionsBuilder:
                              (context, animation, animationTime, child) {
                            animation = CurvedAnimation(
                                parent: animation, curve: Curves.ease);
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          pageBuilder: (context, animation, animationTime) {
                            return SignUpScreen();
                          }),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Đăng ký",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: ColorData.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fixedSize: Size(
                        size.width * 0.4,
                        size.height * 0.075,
                      ),
                    ),
                  )
                : null,
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: size.height * .025,
              top: size.height * 0.025,
            ),
            child: currentIndex == contents.length - 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Đã có tài khoản? ',
                        style: FontStyleData.Paragraph_Regular_20,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 700),
                              transitionsBuilder:
                                  (context, animation, animationTime, child) {
                                animation = CurvedAnimation(
                                    parent: animation, curve: Curves.ease);
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return LoginScreen();
                              }),
                        ),
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: ColorData.clickable,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
          ),
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: List.generate(
          //       contents.length,
          //       (index) => buildDot(index, context),
          //     ),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(bottom: size.height * .01),
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: contents.length,
                effect: ExpandingDotsEffect(
                  dotColor: ColorData.primary,
                  activeDotColor: ColorData.primary,
                  dotHeight: size.height * .01,
                  dotWidth: size.height * .01,
                ),
                onDotClicked: (index) => _controller.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInCubic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Container buildDot(int index, BuildContext context) {
  //   var size = MediaQuery.of(context).size;
  //   return Container(
  //     height: size.height * .015,
  //     width: currentIndex == index ? 25 : 10,
  //     margin: EdgeInsets.only(right: 5),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //       color: ColorData.primary,
  //     ),
  //   );
  // }
}
