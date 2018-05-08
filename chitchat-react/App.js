import React, { Component } from 'react';
import { View, ActivityIndicator } from 'react-native';
import { StackNavigator, SwitchNavigator } from 'react-navigation';
import WelcomeScreen from 'src/auth/welcome_screen';
import HomeScreen from 'src/home_screen';
import ChatroomScreen from 'src/chat/chatroom_screen';
// AWS config
import Amplify from 'aws-amplify';
import AwsConfig from './aws-exports';
import { Font } from 'expo';

Amplify.configure(AwsConfig);

const AppStack = StackNavigator({
	Home: HomeScreen,
	Chatroom: ChatroomScreen
})

const AuthStack = StackNavigator({
	Welcome: WelcomeScreen
});

const RootSwitch = SwitchNavigator({
	Auth: AuthStack,
	App: AppStack,
}, {
	initialRouteName: 'Auth'
});

export default class App extends Component {
	constructor() {
		super();
		this.state = {
			isLoaded: false
		}
	}
	async componentWillMount() {
		await Font.loadAsync({
			'Hind-Light': require('./assets/font/Hind-Light.ttf'),
			'Hind-Regular': require('./assets/font/Hind-Regular.ttf'),
			'Hind-Medium': require('./assets/font/Hind-Medium.ttf'),
			'Hind-SemiBold': require('./assets/font/Hind-SemiBold.ttf'),
		});
		this.setState(() => ({
			isLoaded: true
		}));
	}
	render() {
		if (!this.state.isLoaded) {
			return (
				<View style={{ backgroundColor: 'white', flex: 1, justifyContent: 'center', alignItems: 'center' }}>
					<ActivityIndicator size='large' color='#09D3CC'/>
				</View>
			);
		}
		return <RootSwitch />;
	}
}
