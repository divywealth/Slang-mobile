import 'package:flutter/material.dart';
import 'package:slang_mobile/pages/AddSlang.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 40, 5, 10),
        decoration: BoxDecoration(
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Uderstanding Nigeria",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 40.0,
                color: Color(0xFFa6e3a6)
              ),
            ),
            Text(
              "slangs",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 40.0,
                  color: Color(0xFFa6e3a6)
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "is changing. Naso",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Start by entering a slang,",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                ),
                SizedBox(width: 5,),
                Text(
                  "and our dictionary",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFFa6e3a6),
                      fontSize: 20.0
                  ),
                ),
              ],
            ),
            Text(
              "will spit out the meaning.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFa6e3a6),
                  fontSize: 20.0
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "*For now slang are one way. For example a slang can only translate to its meaning and not the other way round",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
              ),
            ),
            Text(
              "Note: Sorry if you cant see added slangs instantly, Slangs added wont be displayed till it is reviewed and approved",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
              ),
            ),
            Text(
              "-To add slang you have to sign in then your added slang will be reveiwed and approved. You can add multiple slangs",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Search slang full meaning...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xFF48bb48))
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF096a09)),
                      borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF48bb48)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  )
                ),
                  onPressed: () {},
                  child: Text("Search"),
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF48bb48)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  )
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => AddSlang()
                      )
                  );
                },
                child: Text("Add slang"),
              ),
            ),
          ],
        )
      ),
    );
  }
}
