import 'package:flutter/material.dart';
import 'package:medikan/themes/theme_data.dart';
import 'package:medikan/icons.dart';

class Login extends StatelessWidget {
  @override
  final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: ColorData.primaryVariant,
      child:MaterialButton(
        onPressed:(){},
        child: Text('Đăng nhập',
        style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
        padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
        )
    );      
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.secondary,
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         MyFlutterApp.setting,
        //         color: ColorData.onPrimary,
        //       ))
        //   //TODO sublist for icon
        // ],
        title: Text(
          "Đăng nhập",
          style: FontStyleData.H1_bold_36,
        ),
      ),
      body: 
      SingleChildScrollView(
      child:Column(
        children: [
    SizedBox(
            height: 70,
          ),
    Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(20, 0,0, 0),
      child:Text("Số điện thoại",
    style: TextStyle(
        color:ColorData.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 27
    ),
    ),
    ) ,     
    Padding(
  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 15),
  child: TextFormField(
    // controller: emailAddressLoginController,
    obscureText: false,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      //labelText: 'Số điện thoại',
      // labelStyle: (
      //   fontFamily: 'Lexend Deca',
      //   color: Color(0xFF95A1AC),
      //   fontSize: 14,
      //   fontWeight: FontWeight.normal,
      // ),
      hintText: 'Enter your phone...',
      // hintStyle: FlutterFlowTheme.bodyText1.override(
      //   fontFamily: 'Lexend Deca',
      //   color: Color(0xFF95A1AC),
      //   fontSize: 14,
      //   fontWeight: FontWeight.normal,
      // ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
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
    Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(20, 0,0, 0),
      child:Text("Mật khẩu",
    style: TextStyle(
        color:ColorData.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 27
    ),
    ),
    ) ,     
    Padding(
  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 15),
  child: TextFormField(
    // controller: passwordLoginController,
    // obscureText: !passwordLoginVisibility,
    obscureText: true,
    decoration: InputDecoration(
      //labelText: 'Password',
      // labelStyle: FlutterFlowTheme.bodyText1.override(
      //   fontFamily: 'Lexend Deca',
      //   color: Color(0xFF95A1AC),
      //   fontSize: 14,
      //   fontWeight: FontWeight.normal,
      // ),
      hintText: 'Enter your password...',
      // hintStyle: FlutterFlowTheme.bodyText1.override(
      //   fontFamily: 'Lexend Deca',
      //   color: Color(0xFF95A1AC),
      //   fontSize: 14,
      //   fontWeight: FontWeight.normal,
      // ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
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
          size: 25,
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
    //Quên mk
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      SizedBox(
            width: 15,
          ),
      GestureDetector(
            onTap:(){},
            child:Text(
              "Quên mật khẩu?",
              style: TextStyle(
                color:ColorData.clickable,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
          )
    ],),
    
    SizedBox(
            height: 80,
          ),
    //Dang nhap Button
    loginButton,

    SizedBox(
            height: 10,
          ),
    //Chưa có tk, dki
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Text("Chưa có tài khoản? ",
          style: TextStyle(
                fontSize: 16
              ),),
          GestureDetector(
            onTap:(){},
            child:Text(
              "Đăng kí",
              style: TextStyle(
                color:ColorData.clickable,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
          )
      ]
    )  , 
        ],
      ),
      )
    );
  }
}
