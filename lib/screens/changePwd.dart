

import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';

class ChangePwd extends StatelessWidget {
  @override
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
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
          "Đổi mật khẩu",
          style: FontStyleData.H1_bold_36,
        ),
      ),
      body: Column(
        children: [
          Text("Mật khẩu cũ"),
          Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
  child: TextFormField(
    // controller: emailAddressLoginController,
    obscureText: false,
    decoration: InputDecoration(
      labelText: 'Số điện thoại',
      // labelStyle: FlutterFlowTheme.bodyText1.override(
      //   fontFamily: 'Lexend Deca',
      //   color: Color(0xFF95A1AC),
      //   fontSize: 14,
      //   fontWeight: FontWeight.normal,
      // ),
      // hintText: 'Enter your email...',
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
)
,Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
  child: TextFormField(
    // controller: passwordLoginController,
    // obscureText: !passwordLoginVisibility,
    decoration: InputDecoration(
      labelText: 'Mật khẩu mới',
      // labelStyle: FlutterFlowTheme.bodyText1.override(
      //   fontFamily: 'Lexend Deca',
      //   color: Color(0xFF95A1AC),
      //   fontSize: 14,
      //   fontWeight: FontWeight.normal,
      // ),
      hintText: 'Gồm ít nhất 6 ký tự',
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
      suffixIcon: InkWell(
        // onTap: () => setState(
        //   () => passwordLoginVisibility = !passwordLoginVisibility,
        // ),
        child: Icon(
          // passwordLoginVisibility
          //     ? Icons.visibility_outlined
          //     : 
          Icons.visibility_off_outlined,
          color: Color(0xFF95A1AC),
          size: 20,
        ),
      ),
    ),
    // style: FlutterFlowTheme.bodyText1.override(
    //   fontFamily: 'Lexend Deca',
    //   color: Color(0xFF14181B),
    //   fontSize: 14,
    //   fontWeight: FontWeight.normal,
    // ),
  ),
),
Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
  child: TextFormField(
    // controller: passwordLoginController,
    // obscureText: !passwordLoginVisibility,
    decoration: InputDecoration(
      labelText: 'Nhập lại mật khẩu mới',
      // labelStyle: FlutterFlowTheme.bodyText1.override(
      //   fontFamily: 'Lexend Deca',
      //   color: Color(0xFF95A1AC),
      //   fontSize: 14,
      //   fontWeight: FontWeight.normal,
      // ),
      hintText: 'Gồm ít nhất 6 ký tự',
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
      suffixIcon: InkWell(
        // onTap: () => setState(
        //   () => passwordLoginVisibility = !passwordLoginVisibility,
        // ),
        child: Icon(
          // passwordLoginVisibility
          //     ? Icons.visibility_outlined
          //     : 
          Icons.fmd_bad,
          color: Color(0xFF95A1AC),
          size: 20,
        ),
      ),
    ),
    // style: FlutterFlowTheme.bodyText1.override(
    //   fontFamily: 'Lexend Deca',
    //   color: Color(0xFF14181B),
    //   fontSize: 14,
    //   fontWeight: FontWeight.normal,
    // ),
  ),
),

    Row(
      children: [

    ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('Hủy bỏ'),
          ),
     ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('Xác nhận'),
          ),

      ],
    )  , 
    //$_volume
        ],

      ),
    );
  }
}
