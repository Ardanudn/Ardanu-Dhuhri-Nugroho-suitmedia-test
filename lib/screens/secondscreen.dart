import 'package:flutter/material.dart';
import 'package:suitmedia/screens/thirdscreen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String username = "Selected User Name";

  void toThirdScreen (BuildContext context) async{

    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThirdScreen(),
        ));

    setState(() {
      username = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Second Screen",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome"),
                Text("Jhon Doe",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),)
              ],
            ),
            Center(
              child: Text("${username}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                        onPressed: () {
                          toThirdScreen(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2B637B),
                            fixedSize: const Size(310, 42),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: Text("Choose a User"),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
