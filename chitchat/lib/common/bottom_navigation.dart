import "package:flutter/material.dart";
import "package:chitchat/common/style.dart" as Style;

class BottomNavigation extends StatefulWidget<_BottomNavigationState> {
	BottomNavigation({
		this.children,
		this.items,
		this.fadeDuration
	});
	final List<Widget> children;
	final List<List<String>> items;
	final Duration fadeDuration;

	_BottomNavigationState createState() => new _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with TickerProviderStateMixin {

	int _currentIndex = 0;
	int _prevIndex = 1;

	void _changePage(int index) {
		if (index == _currentIndex) return;
		setState(() {
			this._prevIndex = _currentIndex;
			this._currentIndex = index;
		});
	}

	Widget _buildBody() => new Stack(
		children: List.generate(
			widget.children.length,
			(int i) => new AnimatedOpacity(
				opacity: _currentIndex == i ? 1.0 : 0.0,
				duration: widget.fadeDuration == null ? new Duration(milliseconds: 150) : widget.fadeDuration,
				child: widget.children[i]
			)
		)
	);

	Widget _buildButtonBar() => new Row(
		children: List.generate(
			widget.items.length,
			(int i) => new Expanded(
				child: new FlatButton(
					onPressed: () => _changePage(i),
					child: new Image.asset(
						i == _currentIndex ? widget.items[i][0] : widget.items[i][1],
						width: 35.0,
						color: _currentIndex == i ? Style.primary : Style.textLight,
					)
				)
			)
		)
	);

	Widget build(BuildContext context) {
		double width = MediaQuery.of(context).size.width;
		return new Scaffold(
			backgroundColor: Colors.white,
			body: _buildBody(),
			bottomNavigationBar: new Padding(
				padding: const EdgeInsets.symmetric(
					vertical: 15.0
				),
				child: _buildButtonBar()	
			)
		);
	}
}
