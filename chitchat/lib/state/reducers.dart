import "package:redux/redux.dart";
import "app_state.dart";
import "package:chitchat/auth/reducers.dart" as Auth;

Reducer<AppState> appReducer = combineReducers(_getAllReducers());

List<Reducer<AppState>> _getAllReducers() {
	List<Reducer<AppState>> allReducers = new List();
	allReducers.addAll(Auth.reducers);
	/*allReducers.addAll(Auth.reducers);
	allReducers.addAll(Chat.reducers);*/
	return allReducers;
}
