import 'package:flutter/material.dart';
import 'package:slang_mobile/Components/Footer.dart';
import 'package:slang_mobile/Components/NavBar.dart';

class AddSlang extends StatefulWidget {
  const AddSlang({Key? key}) : super(key: key);

  @override
  State<AddSlang> createState() => _AddSlangState();
}

class _AddSlangState extends State<AddSlang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              NavBar(),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFF808080),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Add Slang",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35
                          ),
                        ),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "SLANG",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                              SizedBox(height: 15,),
                              TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(9),
                                        borderSide: BorderSide(color: Color(0xFF48bb48))
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF096a09)),
                                        borderRadius: BorderRadius.circular(9)
                                    )
                                ),
                              ),
                              SizedBox(height: 40,),
                              Text(
                                "MEANING",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                              SizedBox(height: 15,),
                              TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(16.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                    borderSide: BorderSide(color: Color(0xFF48bb48))
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9)
                                  )
                                ),
                                maxLines: null,
                                minLines: 10,
                              ),
                              SizedBox(height: 30),
                              Text(
                                "NOTE: Slangs take a while before it gets public, The meaning has to be confirmed correct by the review team before it gets public, if it gets decline wrong ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17
                                ),
                              ),
                              SizedBox(height: 10,),
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF096a09)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          )
                                      )
                                  ),
                                  child: Text("Done"),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
