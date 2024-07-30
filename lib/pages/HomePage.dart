import 'package:flutter/material.dart';
import 'package:slang_mobile/Components/Body.dart';
import 'package:slang_mobile/Components/Footer.dart';
import 'package:slang_mobile/Components/NavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF096a09),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  NavBar(),
                  Expanded(
                      child: Body()
                  ),
                  Footer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
