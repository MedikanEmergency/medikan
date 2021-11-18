import 'package:flutter/material.dart';
import 'package:medikan/screens/Profile/family_provider.dart';
import 'package:medikan/screens/Profile/model_person.dart';
import 'package:flutter/cupertino.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:provider/provider.dart';
import 'model_person.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MemberWidget extends StatefulWidget {
  MemberModel mem;
  int index;
  MemberWidget({Key? key, required this.mem, required this.index})
      : super(key: key);

  @override
  MemberState createState() => MemberState();
}

class MemberState extends State<MemberWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        // width: MediaQuery.of(context).size.width - 20,
        // height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  child: Image.network(
                    widget.mem.pic,
                    fit: BoxFit.fill,
                    width: width * 0.18,
                    height: width * 0.18,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Row(children: [
                      Text(widget.mem.name, style: FontStyleData.Title_Bold_20),
                      Text(
                        " (" + widget.mem.relate + ")",
                        style: FontStyleData.Mini_Title_Light_16,
                      )
                    ]),
                    subtitle: Text(widget.mem.phone,
                        style: FontStyleData.Paragraph_Regular_20),
                  ),
                ),
                // flex: 7,
              ),
              IconButton(
                  onPressed: () {
                    // Provider.of<FamilyProviders>(context)
                    //     .removeMember(widget.index);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 36.0,
                  )),
            ],
          ),
        ),
        // elevation: 8,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
