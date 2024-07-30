import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:slang_mobile/Components/LoadingButton.dart';
import 'package:slang_mobile/models/user_model.dart';
import 'package:slang_mobile/pages/Authentication/AuthDecorations.dart';
import 'package:slang_mobile/pages/Authentication/Signin.dart';
import 'package:slang_mobile/pages/Authentication/VerifyCode.dart';
import 'package:slang_mobile/pages/HomePage.dart';
import 'package:slang_mobile/store/AppState.dart';
import 'package:slang_mobile/store/actions/user_actions.dart';
import 'package:slang_mobile/util/Validator_util.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
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
                          Center(
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image(
                                image: AssetImage("assets/img/Slang-Logo.png")
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Form(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                //firstname
                                Text(
                                  "Firstname",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                  ),
                                ),
                                SizedBox(height: 6),
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  onSaved: (value) {
                                    firstname = value;
                                  },
                                  validator: (value) => isEmpty(value, "Input firstname"),
                                  decoration: authInputDecoration.copyWith(
                                    hintText: "firstname",
                                    suffixIcon: const Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),
                                //Lastname
                                Text(
                                  "Lastname",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                                SizedBox(height: 6),
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  onSaved: (value) {
                                    lastname = value;
                                  },
                                  validator: (value) => isEmpty(value, "Input lastname"),
                                  decoration: authInputDecoration.copyWith(
                                    hintText: "lastname",
                                    suffixIcon: const Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.black,
                                    ),
                                  ),

                                ),
                                SizedBox(height: 6),
                                //Username
                                Text(
                                  "Username",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                                SizedBox(height: 6),
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  onSaved: (value) {
                                    username = value;
                                  },
                                  validator: (value) => isEmpty(value, "Input username"),
                                  decoration: authInputDecoration.copyWith(
                                    hintText: "username",
                                    suffixIcon: const Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.black,
                                    ),
                                  ),

                                ),
                                //Email
                                SizedBox(height: 6),
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
                                //Password
                                SizedBox(height: 6),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                                SizedBox(height: 6),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: isObscurePassword,
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
                                      isObscurePassword ? Icons.visibility_off
                                      : Icons.visibility,
                                        color: Colors.black,
                                    ),
                                    ),
                                  ),
                                ),
                                //Confirm Password
                                SizedBox(height: 6),
                                Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                                SizedBox(height: 6),
                                TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: isObscureConfirmPassword,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "please confirm your password";
                                    }
                                    if ( value != _passwordController.text) {
                                      return 'Confirm password doesnt match password';
                                    }
                                  },
                                  decoration: authInputDecoration.copyWith(
                                    hintText: "confirm password",
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isObscureConfirmPassword = !isObscureConfirmPassword;
                                        });
                                      },
                                      child: Icon(
                                        isObscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),

                                ),
                                SizedBox(height: 6),
                                LoadingButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        Color(0xFF096a09)
                                    ),
                                  ),
                                  child: Text("Create Account"),
                                  onPressed: () async {
                                    dynamic response = registerUser();
                                    if (response) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => VerifyCodePage( type: VerificationType.emailVerification,)
                                          )
                                      );
                                    }
                                  },
                                ),
                              ]
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account.",
                          style: TextStyle( color: Colors.white),
                        ),
                        SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signin()
                                )
                            );
                          },
                          child: Text(
                            "Signin",
                            style: TextStyle(
                                color: Colors.blue
                            ),
                          ),
                        )
                      ],
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

  Future<void> registerUser() async {
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
      User data = User(
        firstname: firstname,
        lastname: lastname,
        username: username,
        email: email,
        password: _passwordController.text,
      );
      Map<String, dynamic> userData = data.toJson();
      dynamic response = await StoreProvider.of<AppState>(context).dispatch(registerThunkAction(userData));
      return response;
    } catch (error) {
        print(error);
    }
  }
}
