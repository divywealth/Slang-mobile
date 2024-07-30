import 'package:flutter/material.dart';
import 'package:slang_mobile/pages/Profile.dart';


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isLoggedIn = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
      decoration: BoxDecoration(
        color: Color(0xFF096a09),
          border: Border(
              bottom: BorderSide(color: Colors.white54, width: 1.5)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
              child: ClipOval(
                child: Image(
                  image: AssetImage("assets/img/Slang-Logo.png")
                )
              )
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage())
              );
            },
            child: SizedBox(
              height: 50,
                child: ClipOval(
                  child: Image(
              image: AssetImage("assets/img/user-profile1.png"),
                  ),
                )
            ),
          )

        ],
      ),
    );
  }
}
