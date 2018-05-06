import React, { Component } from 'react';
import { StackNavigator, SwitchNavigator } from 'react-navigation';
import WelcomeScreen from 'src/auth/welcome_screen';
import HomeScreen from 'src/home_screen';
// AWS config
import Amplify from 'aws-amplify';
import config from 'src/config';

Amplify.configure({
	Auth: {
		mandatorySignIn: true,
		region: config.cognito.REGION,
		userPoolId: config.cognito.USER_POOL_ID,
		identityPoolId: config.cognito.IDENTITY_POOL_ID,
		userPoolWebClientId: config.cognito.APP_CLIENT_ID
	},
	API: {
		endpoints: [
			{
				name: 'chatroom',
				endpoint: config.apiGateway.URL,
				region: config.apiGateway.REGION,
			}
		]
	}
});

const AppStack = StackNavigator({
	Home: HomeScreen
})

const AuthStack = StackNavigator({
	Welcome: WelcomeScreen
});

export default SwitchNavigator({
	Auth: AuthStack,
	App: AppStack,
}, {
	initialRouteName: 'Auth'
});
