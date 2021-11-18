import 'package:flutter/material.dart';
import 'package:medikan/screens/News_screen/data.dart';
import 'package:medikan/screens/News_screen/article_screen.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/screens/News_screen/viewlater_screen.dart';
import 'package:medikan/screens/News_screen/download_screen.dart';

class ForYouContainer extends StatefulWidget {
  final Article article;

  const ForYouContainer({Key? key, required this.article}) : super(key: key);
  @override
  _ForYouContainerState createState() => _ForYouContainerState();
}

class _ForYouContainerState extends State<ForYouContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 700),
              transitionsBuilder: (context, animation, animationTime, child) {
                animation =
                    CurvedAnimation(parent: animation, curve: Curves.ease);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              pageBuilder: (context, animation, animationTime) {
                return ArticleScreen(article: widget.article);
              }),
          // MaterialPageRoute(
          //   builder: (context) => ArticleScreen(
          //     article: widget.article,
          //   ),
          // ),
        );
      },
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width - 40,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                spreadRadius: 0,
                offset: Offset(3, 3),
              )
            ]),
        child: Row(
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(widget.article.image),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.article.category,
                          style: TextStyle(
                            color: ColorData.sos,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            widget.article.time,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.article.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.article.view,
                              style: TextStyle(
                                  color: ColorData.secondaryVariant,
                                  fontSize: 17,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w300),
                            ),
                            const Icon(
                              MyFlutterApp.eye,
                              size: 19,
                              color: ColorData.secondaryVariant,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Download.add(widget.article);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DownloadPage(),
                              ),
                            );
                          },
                          icon: const Icon(
                            MyFlutterApp.download,
                            size: 19,
                            color: ColorData.secondaryVariant,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                        ),
                        IconButton(
                          onPressed: () {
                            ViewLater.add(widget.article);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewlaterPage(),
                              ),
                            );
                          },
                          icon: const Icon(
                            MyFlutterApp.clock,
                            size: 19,
                            color: ColorData.secondaryVariant,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
