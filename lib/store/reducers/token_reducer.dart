

import 'package:slang_mobile/store/AppState.dart';
import 'package:slang_mobile/store/actions/user_actions.dart';

String? setTokenReducer(String? state, action) {
  if (action is SetTokenAction) {
    return action.token;
  }
  return state;
}

