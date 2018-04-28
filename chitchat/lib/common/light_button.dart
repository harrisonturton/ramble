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
			//shape: new Border.all(width: 2.0, color: Style.primary),
			borderSide: new BorderSide(width: 2.0, color: Style.primary),
			child: new Text(this.text),
			highlightElevation: 0.0,
		);
	}
}
