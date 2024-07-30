import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
      decoration: BoxDecoration(
        color: Color(0xFF096a09),
        border: Border(
          top: BorderSide(color: Colors.white54, width: 1.5)
        )
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              "COPYRIGHTED 2023. ALL RIGHTS RESERVED",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "divywealth1@gmail.com",
              style: TextStyle(color: Colors.white),
            )
          ],
        )
      ),
    );
  }
}
