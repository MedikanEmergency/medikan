import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/models/first_aid_list.dart';


class ItemFirstAid extends StatelessWidget {
  final FirstAid firstaids;
  final VoidCallback press;
  const ItemFirstAid({
    Key? key,
    required this.size,
    required this.firstaids,
    required this.press,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: size.height * .03),
              padding: EdgeInsets.all(size.width * .03),
              //height: size.height * .3,
              //width: size.width * .4,
              decoration: BoxDecoration(
                color: ColorData.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: firstaids.id,
                child: Image.asset(firstaids.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              firstaids.title,
              style: FontStyleData.Title_Bold_20,
            ),
          )
        ],
      ),
    );
  }
}