

import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.secondary,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                MyFlutterApp.setting,
                color: ColorData.onPrimary,
              ))
          //TODO sublist for icon
        ],
        title: Text(
          "Tài khoản của bạn",
          style: FontStyleData.H1_bold_36,
        ),
      ),
      body: Column(
        children: [
          Text("Personal Infor"),
          Card(
            child:Container(
              height: 100,
              color: Colors.white,
              child: Row(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Expanded(
                        child:
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg",
                          ),
                          radius: 50.0,
                        ),
                        flex:2 ,
                      ),
                    ),
                  ),
                  Expanded(
                    child:Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: ListTile(
                              title: Text("Shape Of You"),
                              subtitle: Text("Ed Sheeran"),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child:Text("PLAY"),
                                  onPressed: ()
                                  {},
                                ),
                                SizedBox(width: 8,),
                                TextButton(
                                  child: Text("ADD TO QUEUE"),
                                  onPressed: (){},
                                ),
                                SizedBox(width: 8,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    flex:8 ,
                  ),
                ],
              ),
            ),
            elevation: 8,
            margin: EdgeInsets.all(10),
          ),
          ElevatedButton.icon(

            label: Text('Xem hồ sơ'),
            onPressed: () {
              print('Pressed');
              //Move to Account info
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 24.0,
            ),
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
            ),
          ),
          Text("Danh sách người thân"),
          Card(
            child:Container(

              height: 100,
              color: Colors.white,

              child: Row(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Expanded(
                        child:
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg",
                          ),
                          radius: 50.0,
                        ),
                        flex:2 ,
                      ),
                    ),
                  ),
                  Expanded(
                    child:Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text("Shape Of You"),
                              subtitle: Text("Ed Sheeran"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex:7 ,
                  ),
                  Expanded(
                    child:
                    ElevatedButton.icon(
                      label:Text(""),
                      onPressed: () => {
                        //do something
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 24.0,
                      ),
                    ),
                    flex:1,)
                ],
              ),
            ),
            elevation: 8,
            margin: EdgeInsets.all(10),
          ),
          ElevatedButton.icon(
            label:Text(""),
            onPressed: () => {
              //do something
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 24.0,
            ),
          ),

        ],

      ),
    );
  }
}

