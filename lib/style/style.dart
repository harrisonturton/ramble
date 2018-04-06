import 'package:flutter/material.dart';

var TextLight = const Color.fromRGBO(135, 160, 181, 1.0);
var TextDark = const Color.fromRGBO(60, 64, 83, 1.0);
var TextAlt = const Color.fromRGBO(50, 67, 81, 1.0);

var LabelWeak = new TextStyle(
	fontFamily: "Roboto",
	fontWeight: FontWeight.normal,
	color: TextLight,
	fontSize: 14.0,
);

var LabelStrong = new TextStyle(
	fontFamily: "Roboto",
	fontSize: 14.0,
	fontWeight: FontWeight.w500,
	color: TextDark
);

var PostBody = new TextStyle(
	fontFamily: "Roboto",
	fontWeight: FontWeight.normal,
	fontSize: 16.0,
	height: 1.15,
	color: TextAlt
);