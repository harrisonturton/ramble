import React, { Component } from 'react';
import { RefreshControl, ActivityIndicator, FlatList, Text, View, Image, StyleSheet } from 'react-native';
import { StackNavigator } from 'react-navigation';
import { API } from 'aws-amplify';
import ChatroomListItem from './chatroom_list_item';
import TabBarIcon from 'src/common/tab_bar_icon';

class HeaderRight extends Component {
	render() {
		return (
			<TabBarIcon
				focused={true}
				source={require('assets/icons/create.png')}
			/>
		);
	}
}

export default class ChatroomListScreen extends Component {
	static navigationOptions = {
		title: 'Messages',
		headerRight: <HeaderRight />,
		tabBarIcon: ({ focused }) => (
			<TabBarIcon
				focused={focused}
				source={require('assets/icons/chat_solid.png')}
				unfocusedSource={require('assets/icons/chat_outline.png')}
			/>
		)
	};
	constructor() {
		super();
		this.state = {
			isLoaded: false,
			data: [],
			refreshing: false
		};
		this.fetchChatrooms = this.fetchChatrooms.bind(this);
	}
	componentWillMount() {
		this.fetchChatrooms();
	}
	async fetchChatrooms() {
		try {
			chatrooms = await API.get('dev-chitchat-api', '/chatrooms');
			this.setState(() => ({
				isLoaded: true,
				data: chatrooms,
			}));
			console.log(chatrooms);
		} catch (err) {
			console.log("Error fetching chatroom list");
			console.log(err);
		}
		this.setState(() => ({
			refreshing: false
		}));
	}
	renderItem({ item }) {
		return (
			<ChatroomListItem
				chatroomId={item['chatroom_id']}
				title={item['title']}
				recentMessage={item['recent_message']}
			/>
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
			<View style={styles.listContainer}>
				<FlatList
					refreshControl={
						<RefreshControl
							refreshing={this.state.refreshing}
							onRefresh={this.fetchChatrooms}
						/>
					}
					data={this.state.data}
					keyExtractor={(item, index) => item['chatroom_id']}
					renderItem={this.renderItem}
				/>
			</View>
		);
	}
}

const styles = StyleSheet.create({
	loadingContainer: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
		backgroundColor: 'white'
	},
	listContainer: {
		flex: 1,
		padding: 15,
		backgroundColor: 'white'
	},
});
