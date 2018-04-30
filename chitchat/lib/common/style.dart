import "dart:ui";
import "package:flutter/material.dart";

// Kinda purple primary colour
//final Color primary = const Color.fromRGBO(104, 121, 246, 1.0);
final Color primary = const Color.fromRGBO(58, 203, 198, 1.0);
Color text = const Color.fromRGBO(100, 100, 100, 1.0);
Color textLight = const Color.fromRGBO(142, 150, 164, 1.0);
Color textFaint = const Color.fromRGBO(142, 150, 164, 0.8);
Color searchBar = const Color.fromRGBO(244, 246, 249, 1.0);

TextStyle header = new TextStyle(
	fontWeight: FontWeight.w600,
	fontSize: 18.0,
	color: const Color.fromRGBO(100, 100, 100, 1.0)
);

// Welcome Screen
TextStyle welcomeStyleLight = new TextStyle(
	fontFamily: "Roboto",
	fontWeight: FontWeight.w300,
	fontSize: 34.0,
	color: textLight,
);

TextStyle welcomeStyle = new TextStyle(
	fontFamily: "Roboto",
	fontWeight: FontWeight.w400,
	fontSize: 34.0,
	color: primary,
	height: 1.25,
);

TextStyle errorText = new TextStyle(
	color: Colors.red[300],
);

TextStyle textHeavy = new TextStyle(
	fontWeight: FontWeight.w700,
	fontSize: 26.0,
	color: Colors.black,
);

// Chat
final chatName = new TextStyle(
	fontWeight: FontWeight.w400,
	fontSize: 18.0,
	color: Colors.grey[850]
);
