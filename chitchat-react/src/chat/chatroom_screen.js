import React, { Component } from 'react';
import { ActivityIndicator, FlatList, Text, View, Image, StyleSheet } from 'react-native';
import { StackNavigator } from 'react-navigation';
import { API } from 'aws-amplify';

export default class ChatroomScreen extends Component {
	constructor() {
		super();
		this.state = {
			isLoaded: false,
			data: []
		};
		this.fetchMessages = this.fetchMessages.bind(this);
	}
	componentWillMount() {
		const chatroomId = this.props.navigation.getParam('chatroomId', 'NO-ID');
		console.log(chatroomId);
		this.fetchMessages(chatroomId);
	}
	async fetchMessages(chatroomId) {
		try {
			messages = await API.get('dev-chitchat-api', '/chatrooms/' + chatroomId);
			this.setState(() => ({
				isLoaded: true,
				data: messages
			}));
		} catch (err) {
			console.log("Error fetching messages for " + chatroomId);
			console.log(err);
		}
	}
	renderMessage({ item }) {
		return (
			<View style={styles.messageContainer}>
				<Text style={styles.author}>{item['author']}</Text>
				<Text style={styles.message}>{item['message']}</Text>
			</View>
		);
	}
	render() {
		if (!this.state.isLoaded) {
			return (
				<View style={styles.loadingContainer}>
					<ActivityIndicator size='large' color='#09D3CC'/>
				</View>
			);
		}
		return (
			<View style={styles.container}>
				<FlatList
					data={this.state.data}
					keyExtractor={(item, index) => item['chatroom_id']}
					renderItem={this.renderMessage}
				/>
			</View>
		);
	}
}

const styles = StyleSheet.create({
	container: {
		flex: 1,
		backgroundColor: 'white'
	},
	messageContainer: {
		backgroundColor: 'blue',
		borderRadius: 5.0,
		margin: 15
	},
	author: {
		fontSize: 14,
	},
	message: {
		fontSize: 16,
		color: 'white',
	}
});
