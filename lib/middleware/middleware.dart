import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:newsfeed_2/actions/actions.dart';
import 'package:newsfeed_2/model/app_state.dart';
import 'package:redux_logging/redux_logging.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsfeed_2/model/model.dart' as Model;

List<Middleware<AppState>> createMiddleware() {
	return [
		thunkMiddleware,
		new LoggingMiddleware.printer()
	];
}
