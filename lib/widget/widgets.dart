import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget wAppLoading() {
  return Center(
    child: Platform.isIOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator(),
  );
}

Widget wAuthTitle(String title, String subtitle) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Login',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 3,),
        Text(subtitle),
      ],
    ),
  );
}

Widget wTextDivider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: <Widget>[
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Atau hubungkan dengan',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        Expanded(child: Divider()),
      ],
    ),
  );
}

Widget wGoogleSignin({Function()? onPressed}) {
  return Container(
    width: double.infinity,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
      ),
      icon: Icon(MdiIcons.google,size: 20,),
      label: Text('Google'),
      onPressed: onPressed,
    ),
  );
}

Widget wTextLink({String? text, String? title, Function()? onTap}) {
  return Container(
    margin: EdgeInsets.only(top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text ?? ''),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.transparent,
            child: Text(
              title ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          onTap: onTap,
        ),
      ],
    ),
  );
}

Widget wInputSubmit({
  required BuildContext context,
  required String title,
  required VoidCallback onPressed,
}) {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor, 
        foregroundColor: Colors.white, 
        shape: StadiumBorder(),
      ),
      child: Text(title),
      onPressed: onPressed,
    ),
  );
}

