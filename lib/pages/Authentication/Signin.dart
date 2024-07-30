import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slang_mobile/Components/LoadingButton.dart';
import 'package:slang_mobile/models/user_model.dart';
import 'package:slang_mobile/pages/Authentication/AuthDecorations.dart';
import 'package:slang_mobile/pages/Authentication/Registration.dart';
import 'package:slang_mobile/pages/Authentication/VerifyCode.dart';
import 'package:slang_mobile/pages/HomePage.dart';
import 'package:slang_mobile/store/AppState.dart';
import 'package:slang_mobile/store/actions/user_actions.dart';
import 'package:slang_mobile/util/Validator_util.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscurePassword = true;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF096a09),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
                      decoration: BoxDecoration(
                        color: Color(0xFFfaf9f6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: Image(
                                image: AssetImage("assets/img/Slang-Logo.png")
                            ),
                          ),
                          SizedBox(height: 40),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                //Email
                                Text(
                                  "Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                                SizedBox(height: 6),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (value) {
                                    email = value;
                                  },
                                  validator: (value) => isEmpty(value, "Input email"),
                                  decoration: authInputDecoration.copyWith(
                                    hintText: "email",
                                    suffixIcon: const Icon(
                                      Icons.mail_outline,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),
                                //Password
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                                SizedBox(height: 6),
                                TextFormField(
                                  obscureText: isObscurePassword,
                                  onSaved: (value) {
                                    password = value;
                                  },
                                  validator: (value) => isValidPassword(value, "Input password", "password should be more than 6 char"),
                                  decoration: authInputDecoration.copyWith(
                                    hintText: "password",
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isObscurePassword = !isObscurePassword;
                                        });
                                      },
                                      child: Icon(
                                        isObscurePassword ? Icons.visibility_off : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                StoreConnector<AppState, User?>(
                                  converter: (store) => store.state.user,
                                  builder: (context, user) {
                                    return LoadingButton(
                                      child: Text("Sign in"),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(
                                           Color(0xFF096a09)
                                        ),
                                      ),
                                      onPressed: ()async {
                                        dynamic response = await loginUser();
                                        if( response != null ) {
                                          if (response.status != 'Verified') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => VerifyCodePage(type: VerificationType.emailVerification,))
                                            );
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => HomePage()
                                              )
                                            );
                                          }
                                        }
                                      },
                                    );
                                  }
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VerifyCodePage( type: VerificationType.emailVerification,)
                                          )
                                        );
                                      },
                                        child: Text(
                                          "Forget Password",
                                          style: TextStyle(color: Colors.blue),
                                        )
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 6,),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            padding: const EdgeInsets.only(left: 90, bottom: 10),
                            child: Row(
                              children: [
                                const Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Registration()
                                        )
                                    );
                                  },
                                  child: const Text(
                                    'Sign up.',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }


  dynamic loginUser() {
    final FormState? formState = _formKey.currentState;
    if (formState == null) {
      return;
    }
    bool isValid = formState.validate();
    if(!isValid) {
      return;
    }
    formState.save();
    try {
      User data = User(email: email, password: password);
      Map<String, dynamic> userData = data.loginJson();
      dynamic response = StoreProvider.of<AppState>(context).dispatch(loginThunkAction(userData));
      return response;
    } catch (error) {
      throw error;
    }
  }
}
