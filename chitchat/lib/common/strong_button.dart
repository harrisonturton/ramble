import "package:flutter/material.dart";
import "style.dart" as Style;

class StrongButton extends StatelessWidget {
	StrongButton({
		this.onPressed,
		this.text
	});
	final VoidCallback onPressed;
	final String text;

	@override
	Widget build(BuildContext context) {
		return new FlatButton(
			onPressed: this.onPressed,
			color: Style.primary,
			textColor: Colors.white,
			shape: new Border.all(color: Style.primary),
			child: new Text(this.text)
		);
	}
}
