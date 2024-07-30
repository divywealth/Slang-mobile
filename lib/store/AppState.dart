import 'package:slang_mobile/models/user_model.dart';

class AppState {
  final int counter;
  User? tempUser;
  User? user;
  String? token;
  bool loading;
  String? errormessage;


  AppState({
    required this.counter,
    required this.tempUser,
    required this.user,
    required this.token,
    required this.loading,
    required this.errormessage,
  });

  AppState.initialState()
  : counter = 0,
    user = null,
    token = null,
    tempUser = null,
    loading = false,
    errormessage = null;
}