import React, { Component } from 'react';
import { TouchableOpacity, Text, StyleSheet } from 'react-native';

export default class ChatroomListItem extends Component {
	handleOpenChatroom = () => {
		console.log("Opening chatroom " + this.props.chatroomId);
	}
	render() {
		return (
			<TouchableOpacity
				onPress={this.handleOpenChatroom}
				style={styles.container}
			>
				<Text style={styles.title}>{this.props.title}</Text>
				<Text style={styles.recentMessage}>{this.props.recentMessage}</Text>
			</TouchableOpacity>
		);
	}
}

const styles = StyleSheet.create({
	container: {
		marginTop: 15
	},
	title: {
		fontSize: 18
	},
	recentMessage: {
		opacity: 0.6
	}
});
