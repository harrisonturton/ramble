import "package:flutter/material.dart";
import "style.dart" as Style;

class LightButton extends StatelessWidget {
	LightButton({
		this.onPressed,
		this.text
	});
	final VoidCallback onPressed;
	final String text;

	@override
	Widget build(BuildContext context) {
		return new OutlineButton(
			onPressed: this.onPressed,
			color: Style.primary,
			textColor: Style.primary,
			borderSide: new BorderSide(width: 2.0, color: Style.primary),
			shape: new StadiumBorder(),
			child: new Text(this.text),
			highlightElevation: 0.0,
		);
	}
}
