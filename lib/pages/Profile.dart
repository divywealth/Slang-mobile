import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isPendingSlang = false;
  bool isAllSlang =  false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        color: Colors.grey,
                        height: 100,
                      ),
                      Positioned(
                        top: 55,
                        left: 0,
                        right: 0,
                        child: Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipOval(
                                  child: SizedBox(
                                    height: 150,
                                    child: Image(image: AssetImage("assets/img/user-profile1.png"),),
                                  )
                              ),
                              Positioned(
                                right: 130,
                                bottom: 10,
                                child: ClipOval(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        color: Colors.lightGreenAccent,
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.camera_alt_sharp, size: 25,),
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 110),
                  Text(
                    "Onuora Divine",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Divyblaq",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 1.0),
                        bottom: BorderSide(color: Colors.black, width: 1.0),
                      )
                    ),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "divywealth1@gmail.com",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Phone",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "09018317817",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {
                      print('Hi');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout_sharp),
                        Text("Log Out", style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isPendingSlang = !isPendingSlang;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          width: 160,
                          decoration: BoxDecoration(
                            color: Color(0xFF48bb48),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pending Slang",
                                style: TextStyle(),
                              ),
                              isPendingSlang ? Icon(Icons.arrow_drop_down_sharp)
                              : Icon(Icons.arrow_drop_up_sharp)
                            ],
                          )
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAllSlang = !isAllSlang;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            width: 160,
                          decoration: BoxDecoration(
                            color: Color(0xFF48bb48),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "All Slang",
                                style: TextStyle(),
                              ),
                              isAllSlang ? Icon(Icons.arrow_drop_down_sharp)
                                  : Icon(Icons.arrow_drop_up_sharp)
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(19),
                    child: Table(
                      border: TableBorder.all(width: 1, color: Color(0xFFd6dbd5)),
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Center(
                                    child: Text(
                                      "Slang",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  )
                                )
                            ),
                            TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Center(
                                    child: Text(
                                      "Meaning",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  )
                                )
                            ),
                          ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(7),
                                      child: Center(
                                        child: Text(
                                          "Slang",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                  )
                              ),
                              TableCell(
                                  child: Padding(
                                      padding: EdgeInsets.all(7),
                                      child: Center(
                                        child: Text(
                                          "Meaning",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                  )
                              ),
                            ]
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
