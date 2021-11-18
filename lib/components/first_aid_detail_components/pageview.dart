import 'package:flutter/material.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/models/first_aid_list.dart';
import 'package:medikan/themes/theme_data.dart';

class PageViewFA extends StatelessWidget {
  final FirstAid firstaids;
  final PageController pageController;

  const PageViewFA({Key? key, required this.firstaids, required this.pageController,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: PageView.builder(
          controller: pageController,
          itemCount: firstaids.descript.length,
          itemBuilder: (context, index) {
            return Stack(
              children: <Widget>[
                // Container(
                //   padding: EdgeInsets.only(top: size.height * .02),
                //   child: ElevatedButton.icon(
                //     icon: Icon(
                //       MyFlutterApp.return_icon,
                //       size: 16,
                //       color: Colors.black,
                //     ),
                //     label: Text(
                //       'Quay về',
                //       style: FontStyleData.Button_bold_27,
                //     ),
                //     onPressed: () => Navigator.pop(context),
                //     style: ElevatedButton.styleFrom(
                //       elevation: 15,
                //       primary: ColorData.secondary,
                //       shape: new RoundedRectangleBorder(
                //           borderRadius: new BorderRadius.only(
                //         topRight: Radius.circular(16),
                //         bottomRight: Radius.circular(16),
                //       )),
                //     ),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.only(
                    top: size.height * .05,
                    bottom: size.height * .05,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      firstaids.title,
                      style: FontStyleData.H2_bold_30,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * .1,
                        bottom: size.height * .05,
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          firstaids.descript[index].image,
                          height: size.height * .5,
                          width: size.width * .8,
                        ),
                      ),
                    ),
                    Text(
                      firstaids.descript[index].step,
                      style: FontStyleData.Button_bold_27,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(size.height * .03),
                        child: Text(
                          firstaids.descript[index].descript,
                          style: FontStyleData.Paragraph_Regular_20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
