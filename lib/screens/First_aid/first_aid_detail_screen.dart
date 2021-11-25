import 'package:flutter/material.dart';
import 'package:medikan/components/first_aid_detail_components/pageview.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/models/first_aid_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../themes/theme_data.dart';

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
      appBar: AppBar(
        toolbarHeight: size.height * .1,
        leadingWidth: size.width,
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: size.height * .015),
          padding: EdgeInsets.only(top: size.height * .01),
          child: ElevatedButton.icon(
            icon: Padding(
              padding: EdgeInsets.only(right: size.width * .01),
              child: Icon(
                MyFlutterApp.return_icon,
                size: 16,
                color: Colors.black,
              ),
            ),
            label: Text(
              'Quay về',
              style: TextStyle(
                color: ColorData.onPrimary,
                fontSize: 16,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              elevation: ElevationData.elevated0,
              primary: ColorData.secondary,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )),
            ),
          ),
        ),
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
      ),
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
                        dotHeight: size.height * .01,
                        dotWidth: size.height * .01,
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
