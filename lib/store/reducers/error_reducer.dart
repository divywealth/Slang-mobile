

import 'package:slang_mobile/store/actions/error_actions.dart';

String? errorMessageReducer (String? state, action) {
  if (action is LoginErrorAction) {
    return action.errormessage;
  }
  return state;
}