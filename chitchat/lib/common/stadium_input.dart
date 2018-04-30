import "package:chitchat/common/style.dart" as Style;
import "package:flutter/material.dart";

class StadiumInput extends StatefulWidget<_StadiumInputState> {
	StadiumInput({this.controller, this.onTap});
	final TextEditingController controller;
	final VoidCallback onTap;

	@override
	_StadiumInputState createState() => new _StadiumInputState();
}

class _StadiumInputState extends State<StadiumInput> {

	@override
	Widget build(BuildContext context) {
		return new Container(
			padding: new EdgeInsets.symmetric(
				horizontal: 12.5,
				vertical: 1.0
			),
			child: new Row(
				children: [
					new Flexible(
						child: new TextField(
							controller: this.widget.controller,
							decoration: new InputDecoration(
								hintText: "Aa",
								border: InputBorder.none,
								contentPadding: const EdgeInsets.only(
									top: 12.5, bottom: 12.5, left: 5.0
								)
							)
						),
					),
					new InkWell(
						onTap: widget.onTap,
						child: new Icon(
							Icons.send,
							color: Style.primary
						)
					),
				]
			),
			decoration: new BoxDecoration(
				color: Colors.white,
				//shape: new StadiumBorder(),
				borderRadius: new BorderRadius.circular(100.0),
				boxShadow: [
					new BoxShadow(
						color: Colors.grey[400],
						blurRadius: 2.0
					)
				]
			)
		);
	}
}
