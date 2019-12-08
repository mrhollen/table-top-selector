import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderErrorMessage extends StatelessWidget {
  HeaderErrorMessage({this.header, this.message, this.closeCallBack}) : super();

  final String header;
  final String message;
  final Function closeCallBack;

  @override
  Widget build(BuildContext context) {
    if (header == null && message == null) {
      return Container();
    } else {
      return GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          padding: EdgeInsets.all(8.0),
          color: Color.fromRGBO(155, 0, 0, 1),
          child: ListView(
            children: <Widget>[
              RichText(text: TextSpan(text: header, style: TextStyle(color: Colors.white, fontSize: 20))),
              RichText(text: TextSpan(text: message, style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
        onTap: closeCallBack,
      );
    }
  }
}