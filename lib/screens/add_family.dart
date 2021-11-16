import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';

class Family extends StatelessWidget {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
          "Thêm người thân",
          style: FontStyleData.H1_bold_36,
        ),
      ),
      body: Column(
        children: [
          Text("Họ và tên"),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: TextFormField(
              // controller: emailAddressLoginController,
              obscureText: false,

              decoration: InputDecoration(
                labelText: 'Họ và tên', //TODO get user info
                // labelStyle: FlutterFlowTheme.bodyText1.override(
                //   fontFamily: 'Lexend Deca',
                //   color: Color(0xFF95A1AC),
                //   fontSize: 14,
                //   fontWeight: FontWeight.normal,
                // ),
                hintText: '',
                // hintStyle: FlutterFlowTheme.bodyText1.override(
                //   fontFamily: 'Lexend Deca',
                //   color: Color(0xFF95A1AC),
                //   fontSize: 14,
                //   fontWeight: FontWeight.normal,
                // ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
              ),
              // style: FlutterFlowTheme.bodyText1.override(
              //   fontFamily: 'Lexend Deca',
              //   color: Color(0xFF14181B),
              //   fontSize: 14,
              //   fontWeight: FontWeight.normal,
              // ),
            ),
          ),
          Text("Số điện thoại"),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: TextFormField(
              // controller: emailAddressLoginController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: '_ _ _ _ _ _ _ _ _',
                // labelStyle: FlutterFlowTheme.bodyText1.override(
                //   fontFamily: 'Lexend Deca',
                //   color: Color(0xFF95A1AC),
                //   fontSize: 14,
                //   fontWeight: FontWeight.normal,
                // ),
                hintText: '', //TODO get user info
                // hintStyle: FlutterFlowTheme.bodyText1.override(
                //   fontFamily: 'Lexend Deca',
                //   color: Color(0xFF95A1AC),
                //   fontSize: 14,
                //   fontWeight: FontWeight.normal,
                // ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
              ),
              // style: FlutterFlowTheme.bodyText1.override(
              //   fontFamily: 'Lexend Deca',
              //   color: Color(0xFF14181B),
              //   fontSize: 14,
              //   fontWeight: FontWeight.normal,
              // ),
            ),
          ),
          Text("Mối liên hệ"),
// _buildPanel(),
          DropdownButton<String>(
            value: _chosenValue,
            underline: Container(), // this is the magic
            items: <String>[
              'Ông/bà',
              'Cha/mẹ',
              'Vợ/chồng',
              'Anh/Chị',
              'Con/Cháu',
              'Họ hàng',
              'Khác'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              _chosenValue = value;
            },
          ),
          Text("Ảnh đại diện"),
          Row(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  // onTap: () => setState(
                  //   () => passwordLoginVisibility = !passwordLoginVisibility,
                  // ),
                  child: Icon(
                    // passwordLoginVisibility
                    //     ? Icons.visibility_outlined
                    //     :
                    Icons.upload_rounded,
                    color: Color(0xFF95A1AC),
                    size: 20,
                  ),
                ),
                flex: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
