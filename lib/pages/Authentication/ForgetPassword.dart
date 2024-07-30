import 'package:flutter/material.dart';
import 'package:slang_mobile/pages/Authentication/Registration.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                              height: 60,
                              width: 60,
                              child: Image(
                                image: AssetImage("assets/img/Slang-Logo.png")
                              )
                            ),
                            SizedBox(height: 40,),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                                labelText: 'Email',
                                suffixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                          ],
                        )
                      ),
                    ],
                  ),
                )
              ),
              Positioned(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_context) => Registration(),
                                ));
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: 10,
                left: 0,
                right: 0,
              ),
            ],
          )
      ),
    );
  }
}
