

import 'package:slang_mobile/store/AppState.dart';
import 'package:slang_mobile/store/reducers/error_reducer.dart';
import 'package:slang_mobile/store/reducers/loading_reducer.dart';
import 'package:slang_mobile/store/reducers/token_reducer.dart';
import 'package:slang_mobile/store/reducers/user_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      counter: state.counter,
      user: setUserReducer(state.user, action),
      tempUser: setTempUserReducer(state.tempUser, action),
      token: setTokenReducer(state.token, action),
      loading: loadingReducer(state.loading, action),
      errormessage: errorMessageReducer(state.errormessage, action)
  );
}