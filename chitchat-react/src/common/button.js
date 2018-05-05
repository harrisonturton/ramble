import React, { Component } from 'react';
import { TouchableOpacity, Text, View, StyleSheet } from 'react-native';

export class Button extends Component {
	render() {
		return (
			<TouchableOpacity
				onPress={this.props.onPress}
				style={[styles.buttonContainer, this.props.buttonStyle]}
			>
				<Text style={[styles.buttonText, this.props.textStyle]}>
					{this.props.text}
				</Text>
			</TouchableOpacity>
		);
	}
}

export class OutlineButton extends Component {
	render() {
		return (
			<Button
				text={this.props.text}
				onPress={this.props.onPress}
				buttonStyle={[styles.outlineButton, this.props.buttonStyle]}
				textStyle={[styles.outlineButtonText, this.props.textStyle]}
			/>
		);
	}
}

const styles = StyleSheet.create({
	buttonContainer: {
		alignItems: 'center',
		margin: 10,
		padding: 10,
		borderRadius: 50,
		backgroundColor: '#09D3CC'
	},
	outlineButton: {
		backgroundColor: 'transparent',
		borderRadius: 50,
		borderWidth: 1,
		borderColor: '#09D3CC'
	},
	buttonText: {
		color: 'white',
		fontSize: 16
	},
	outlineButtonText: {
		color: '#09D3CC',
	}
});
