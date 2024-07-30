import 'package:flutter/material.dart';
import 'package:slang_mobile/Components/LoadingButton.dart';
import 'package:slang_mobile/pages/Authentication/AuthDecorations.dart';
import 'package:slang_mobile/util/Validator_util.dart';

enum VerificationType {
  emailVerification,
  passwordreset
}

class VerifyCodePage extends StatefulWidget {
  final VerificationType type;
  const VerifyCodePage({Key? key, required this.type}) : super(key: key);

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? code;
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
                          SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Center(
                                  child: Text("Input Code sent to your email"),
                                ),
                                SizedBox(height: 40),
                                Text(
                                  "Code",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  onSaved: (value) {
                                    code = value;
                                  },
                                  validator: (value) => isEmpty(value, "Insert Code"),
                                  decoration: authInputDecoration.copyWith(
                                    hintText: "Code"
                                  ),
                                ),
                                SizedBox(height: 10),
                                LoadingButton(
                                  onPressed: () {
                                    dynamic response = verifyCode();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        Color(0xFF096a09)
                                    ),
                                  ),
                                  child: Text("Submit"),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("00:12"),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Resend Code",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic verifyCode() {
    final FormState? formState = _formKey.currentState;
    if (formState == null) {
      return;
    }
    bool isValid = formState.validate();
  }
}
