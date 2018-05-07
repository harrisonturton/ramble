import React, { Component } from 'react';
import { StackNavigator, SwitchNavigator } from 'react-navigation';
import WelcomeScreen from 'src/auth/welcome_screen';
import HomeScreen from 'src/home_screen';
// AWS config
import Amplify from 'aws-amplify';
import AwsConfig from './aws-exports';

Amplify.configure(AwsConfig);

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
