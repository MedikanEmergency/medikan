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
      child: Card(
        elevation: ElevationData.elevated15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: ColorData.secondaryVariant,
            ),
            borderRadius: BorderRadius.circular(15.0),
            
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)),
                  child: Hero(
                    tag: firstaids.id,
                    child: Image.asset(
                      firstaids.image,
                    ),
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
        ),
      ),
    );
  }
}
