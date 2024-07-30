

import 'package:slang_mobile/store/actions/loading_actions.dart';

bool loadingReducer(bool state, action) {
  if (action is LogInLoadingAction) {
    return action.isLoggingIn;
  }
  return state;
}