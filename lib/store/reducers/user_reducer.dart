
import 'package:slang_mobile/models/user_model.dart';
import 'package:slang_mobile/store/AppState.dart';
import 'package:slang_mobile/store/actions/user_actions.dart';

  User? setUserReducer(User? state, dynamic action) {
    if (action is SetUserAction) {
      return action.user;
    }
  return state;
}

User? setTempUserReducer(User? state, dynamic action) {
    if (action is SetTempUserAction) {
      return action.user;
    }
    return state;
}