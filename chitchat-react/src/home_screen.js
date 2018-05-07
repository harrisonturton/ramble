import React, { Component } from 'react';
import { Text, View } from 'react-native';
import { TabNavigator } from 'react-navigation';
import ChatroomListScreen from 'src/chat/chatroom_list_screen';

class NewsfeedScreen extends Component {
	static navigationOptions = {
		title: 'Newsfeed',
	};
	render() {
		return (
			<View style={{ flex: 1, backgroundColor: 'white' }}>
				<Text>Newsfeed!</Text>
			</View>
		);
	}
}

export default HomeScreen = TabNavigator({
	Newsfeed: NewsfeedScreen,
	ChatroomList: ChatroomListScreen,
}, {
	tabBarPosition: 'bottom',
	navigationOptions: {
		headerStyle: {
			elevation: 0,
			shadowOpacity: 0
		}
	},
	tabBarOptions: {
		style: {
			backgroundColor: 'white',
			elevation: 0
		},
		labelStyle: {
			color: 'black'
		},
		indicatorStyle: {
			backgroundColor: '#09D3CC',
			top: 0
		}
	}
});
