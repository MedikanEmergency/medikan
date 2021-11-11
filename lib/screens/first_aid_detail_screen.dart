import 'package:flutter/material.dart';
import 'package:medikan/components/first_aid_detail_components/pageview.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/models/first_aid_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../themes/theme_data.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    Key? key,
    required this.firstaids,
  }) : super(key: key);

  final FirstAid firstaids;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageViewFA(
              pageController: _pageController,
              firstaids: widget.firstaids,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: widget.firstaids.descript.length,
                      effect: ExpandingDotsEffect(
                        dotColor: ColorData.primary,
                        activeDotColor: ColorData.primary,
                        dotHeight: size.height * .02,
                        dotWidth: size.height * .02,
                      ),
                      onDotClicked: (index) => _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInCubic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
