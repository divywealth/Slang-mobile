import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slang_mobile/pages/Authentication/Registration.dart';
import 'package:slang_mobile/pages/Authentication/Signin.dart';
import 'package:slang_mobile/pages/Authentication/VerifyCode.dart';
import 'package:slang_mobile/pages/HomePage.dart';
import 'package:slang_mobile/SplashScreen.dart';
import 'package:slang_mobile/store/AppState.dart';
import 'package:slang_mobile/store/store.dart';

void main() {
  runApp(StoreProvider<AppState>(
      store: store,
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => SplashScreen(),
        '/Signup': (context) => Registration(),
        '/Signin': (context) => Signin(),
        '/': (context) => HomePage(),
      },
    );
  }
}

