
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:slang_mobile/apis/auth_api.dart';
import 'package:slang_mobile/models/user_model.dart';
import 'package:slang_mobile/store/AppState.dart';

class IncrementUserAction {}

class DecrementUserAction {}

class SetUserAction {
  final User? user;
  SetUserAction(this.user);
}

class SetTempUserAction {
  final User? user;
  SetTempUserAction(this.user);
}

class SetTokenAction {
  final String? token;
  SetTokenAction(this.token);
}

ThunkAction<AppState> registerThunkAction(Map<String, dynamic> data) {
  return (Store<AppState> store) async {
    try {
      dynamic response = await registerUser(data);
      User user = User.fromJson(response['user']);
      String token = response['access_token'];
      store.dispatch(SetTokenAction(token));
      store.dispatch(SetTempUserAction(user));
      return response;
    } catch (error) {
      print(error);
    }
  };
}

ThunkAction<AppState> loginThunkAction(Map<String, dynamic> data) {
  return (Store<AppState> store) async {
    try {
      dynamic response = await loginUser(data);
      User user = User.fromJson(response['user']);
      String token = response['access_token'];
      if (user.status != "Verified") {
        store.dispatch(SetTempUserAction(user));
      }else {
        store.dispatch(SetUserAction(user));
      }
      store.dispatch(SetTokenAction(token));
      return user;
    } catch (error) {
      print(error);
    }
  };
}

ThunkAction<AppState> verifyUserThunkAction() {
  return (Store<AppState> store) async {

  };
}

ThunkAction<AppState> updatePasswordThunkAction() {
  return (Store<AppState> store) async {

  };
}

ThunkAction<AppState> updateEmailThunkAction() {
  return (Store<AppState> store) async {

  };
}

ThunkAction<AppState> updateProfilePicThunkAction() {
  return (Store<AppState> store) async {

  };
}

ThunkAction<AppState> updateUsernameThunkAction() {
  return (Store<AppState> store) async {

  };
}


ThunkAction<AppState> resetPasswordThunkAction() {
  return (Store<AppState> store) async {

  };
}

ThunkAction<AppState> logOutThunkAction() {
  return (Store<AppState> store) async {
    store.dispatch(SetUserAction(null));
    store.dispatch(SetTokenAction(null));
  };
}