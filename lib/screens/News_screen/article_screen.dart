import 'package:flutter/material.dart';
import 'package:medikan/screens/News_screen/data.dart';
import 'package:medikan/screens/News_screen/news_screen.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/screens/News_screen/ForYouContainer.dart';
class ArticleScreen extends StatefulWidget {
  final Article article;

  const ArticleScreen({Key? key,required this.article}) : super(key: key);
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // actions: [
          //    Positioned(
          //     left: 10,
          //     top: 10,
          //     child: 
          // IconButton(
          //   onPressed: () {
          //         Navigator.of(context).pop(context);
          //         },
          //     icon: const Icon(
          //         Icons.arrow_back,
          //         size:30,
          //         color: ColorData.onPrimary,
          //         ),
          //       ),
          // ),
          // ],
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
          widget.article.category,
          style: TextStyle(
              color: ColorData.onPrimary,
              fontSize: 27,
              fontWeight: FontWeight.bold,
          ),
          ),
          centerTitle: true,
          backgroundColor: ColorData.secondary,
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(widget.article.image),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.article.author,
                            style: TextStyle(
                              color: ColorData.sos,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.article.time,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.article.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            widget.article.authorImg,
                            height: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.article.description,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          //fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
