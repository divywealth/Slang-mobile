

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:slang_mobile/store/AppState.dart';
import 'package:slang_mobile/store/reducers/reducers.dart';

final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initialState(),
    middleware: [thunkMiddleware],
);