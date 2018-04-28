import "package:flutter/material.dart";

class VerticalSpace extends StatelessWidget {
	VerticalSpace(this.height);
	final double height;

	@override
	Widget build(BuildContext context) {
		return new Padding(
			padding: new EdgeInsets.symmetric(vertical: height)
		);
	}
}
