import 'package:flutter/material.dart';
import 'dart:ui';

var TextLight = const Color.fromRGBO(143, 160, 173, 1.0);
var TextDark = const Color.fromRGBO(60, 64, 83, 1.0);
var TextAlt = const Color.fromRGBO(50, 67, 81, 1.0);

var Primary = const Color.fromRGBO(144, 71, 255, 1.0);
var HomeComment = Primary;
//var HomeComment = const Color.fromRGBO(66, 134, 245, 1.0);
//var AwayComment = const Color.fromRGBO(244, 245, 248, 1.0);
var AwayComment = const Color.fromRGBO(234, 234, 234, 1.0);

var LabelNormal = new TextStyle(
	fontFamily: "Roboto",
	fontSize: 16.0,
	fontWeight: FontWeight.normal,
	color: TextDark,
	decoration: TextDecoration.none
);

var LabelWeak = new TextStyle(
	fontFamily: "Roboto",
	fontWeight: FontWeight.normal,
	color: TextLight,
	fontSize: 14.0,
	decoration: TextDecoration.none
);

var LabelStrong = new TextStyle(
	fontFamily: "Roboto",
	fontSize: 15.0,
	fontWeight: FontWeight.w500,
	color: TextDark,
	decoration: TextDecoration.none
);

var PostBody = new TextStyle(
	fontFamily: "Roboto",
	fontWeight: FontWeight.normal,
	fontSize: 15.0,
	height: 1.15,
	color: TextAlt,
	decoration: TextDecoration.none
);
