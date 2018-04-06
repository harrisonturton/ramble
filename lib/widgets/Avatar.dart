import "package:flutter/material.dart";

class Avatar extends StatelessWidget {
	Avatar({this.backgroundImage, this.size});
	final ImageProvider backgroundImage;
	final double size;

	@override
	Widget build(BuildContext context) {
		return new Container(
			constraints: new BoxConstraints(
				minHeight: size,
				maxHeight: size,
				minWidth: size,
				maxWidth: size,
			),
			decoration: new BoxDecoration(
				shape: BoxShape.circle,
				image: new DecorationImage(
					image: backgroundImage,
					fit: BoxFit.cover
				)
			)
		);
	}
}
