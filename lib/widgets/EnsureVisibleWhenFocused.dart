import "dart:async";
import "package:meta/meta.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

// Taken from https://stackoverflow.com/a/46184323/3668541

class EnsureVisibleWhenFocused extends StatefulWidget {
	const EnsureVisibleWhenFocused({
		Key key,
		@required this.child,
		@required this.focusNode,
		this.curve: Curves.ease,
		this.duration: const Duration(milliseconds: 100),
	}) : super(key: key);

	// The node we will monitor to determine if the child is focused
	final FocusNode focusNode;
	// The child widget that we are wrapping
	final Widget child;
	final Curve curve;
	final Duration duration;

	EnsureVisibleWhenFocusedState createState() => new EnsureVisibleWhenFocusedState();
}

class EnsureVisibleWhenFocusedState extends State<EnsureVisibleWhenFocused> {
	@override
	void initState() {
		super.initState();
		widget.focusNode.addListener(_ensureVisible);
	}

	@override
	void dispose() {
		super.dispose();
		widget.focusNode.removeListener(_ensureVisible);
	}

	Future<Null> _ensureVisible() async {
		// Wait for keyboard to come into view.
		await new Future.delayed(const Duration(milliseconds: 600));

		if (!widget.focusNode.hasFocus) {
			return;
		}

		final RenderObject object = context.findRenderObject();
		final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
		assert(viewport != null);

		ScrollableState scrollableState = Scrollable.of(context);
		assert(scrollableState != null);

		ScrollPosition position = scrollableState.position;
		double alignment;
		if (position.pixels < viewport.getOffsetToReveal(object, 1.0)) {
			// Move to bottom of viewport
			alignment = 1.0;
		} else {
			// No scrolling required
			return;
		}
		position.ensureVisible(
			object,
			alignment: alignment,
			duration: widget.duration,
			curve: widget.curve
		);
	}	

	Widget build(BuildContext context) => widget.child;
}
