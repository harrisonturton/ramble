import "package:redux/redux.dart";
import "app_state.dart";
import "package:chitchat/welcome/reducers.dart" as Welcome;

Reducer<AppState> appReducer = combineReducers(_getAllReducers());

List<Reducer<AppState>> _getAllReducers() {
	List<Reducer<AppState>> allReducers = new List();
	allReducers.addAll(Welcome.reducers);
	/*allReducers.addAll(Auth.reducers);
	allReducers.addAll(Chat.reducers);*/
	return allReducers;
}
