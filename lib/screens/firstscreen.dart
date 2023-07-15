import 'package:flutter/material.dart';
import 'package:suitmedia/screens/secondscreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController _palindromecont = TextEditingController();
  TextEditingController _namecont= TextEditingController();

  bool isPalindrome = false;

  void checkPalindrome(){
    String text = _palindromecont.text.replaceAll(' ', '');
    String reversedText = String.fromCharCodes(text.runes.toList().reversed);

    isPalindrome = text.toLowerCase() == reversedText.toLowerCase();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isPalindrome ? 'isPalindrome' : 'Not Palindrome'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 116,
                  width: 116,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/icons/ic_photo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _namecont,
                  decoration: InputDecoration(
                    hintText: "Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _palindromecont,
                  decoration: InputDecoration(
                    hintText: "Palindrome",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                ElevatedButton(
                  onPressed: () => checkPalindrome(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2B637B),
                    fixedSize: const Size(310, 42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("CHECK"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const SecondScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2B637B),
                        fixedSize: const Size(310, 42),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text("NEXT"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
