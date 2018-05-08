import React, { Component } from 'react';
import { Image, ImageSourcePropType, StyleSheet } from 'react-native';

export default class TabBarIcon extends Component {
	render() {
		return (
			<Image
				source={this.props.focused ? this.props.source : this.props.unfocusedSource}
				style={[
					this.props.style,
					styles.icon,
					this.props.focused ? styles.focusedTint : styles.unfocusedTint
				]}
			/>
		);
	}
}

const styles = StyleSheet.create({
	icon: {
		padding: 5,
		width: 30,
		height: 30,
		resizeMode: 'contain',
	},
	focusedTint: {
		tintColor: '#09D3CC'
	},
	unfocusedTint: {
		tintColor: 'black'
	}
});
