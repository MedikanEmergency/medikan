import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';
import 'package:medikan/models/first_aid_list.dart';
import 'package:medikan/components/first_aid_components/first_aid_card.dart';
import 'package:medikan/screens/First_aid/first_aid_detail_screen.dart';

class FirstAids extends StatefulWidget {
  FirstAids({Key? key}) : super(key: key);
  @override
  _FirstAidsState createState() => _FirstAidsState();
}

class _FirstAidsState extends State<FirstAids> {
  TextEditingController _controller = new TextEditingController();
  List<FirstAid> _searchList = [];

  bool _IsSearching = false;
  String _searchText = "";
  _FirstAidsState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _controller.text;
          _buildSearchList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  void init() {
    _searchList = firstaid;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        _controller.clear();
      },
      child: Column(
        children: [
          Container(
            height: size.height * .12,
            padding: EdgeInsets.only(
              top: 20,
              left: 15,
              right: 15,
              bottom: 10,
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  height: size.height * .0005,
                ),
                filled: true,
                fillColor: ColorData.surface,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorData.onPrimary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: ColorData.onPrimary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: ColorData.onPrimary,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: ColorData.onPrimary,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                itemCount: _searchList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.83,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) => ItemFirstAid(
                  firstaids: _searchList[index],
                  size: size,
                  press: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder: (context, animation, animationTime, child) {
                        animation = CurvedAnimation(
                          parent: animation,
                          curve: Curves.ease
                        );
                        return FadeTransition(
                          
                          opacity: animation,
                          child: child,
                        );
                      },
                      pageBuilder: (context, animation, animationTime) {
                        return DetailScreen(firstaids: firstaid[index]);
                      }
                    ),
                    // MaterialPageRoute(
                    //   builder: (context) => DetailScreen(
                    //     firstaids: firstaid[index],
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<FirstAid> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = firstaid;
    } else {
      _searchList = firstaid
          .where((element) =>
              element.title.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      return _searchList;
    }
  }
}
