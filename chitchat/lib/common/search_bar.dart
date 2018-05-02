import "package:chitchat/common/style.dart" as Style;
import "package:flutter/material.dart";

class SearchBar extends StatelessWidget {
	SearchBar({ 
		this.enabled=true,
		this.controller
	});
	final bool enabled;
	final TextEditingController controller;

	@override
	Widget build(BuildContext context) {
		return new Container(
			padding: new EdgeInsets.symmetric(
				vertical: 1.0,
				horizontal: 5.0
			),
			child: new TextField(
				enabled: enabled,
				controller: controller,
				decoration: new InputDecoration(
					hintText: "Search",
					border: InputBorder.none,
					contentPadding: const EdgeInsets.only(
						left: 10.0,
						top: 7.0, bottom: 7.0
					)
				)
			),
			decoration: new BoxDecoration(
				color: Style.searchBar,
				borderRadius: new BorderRadius.circular(100.0)
			)
		);
	}
}
