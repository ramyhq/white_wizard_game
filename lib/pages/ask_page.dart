import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_flashlight/flutter_flashlight.dart';




class AskPage extends StatelessWidget {
  AskPage({required this.userBorg});
  final String? userBorg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Asker(),
    );
  }
}

class Asker extends StatefulWidget {
  @override
  _AskerState createState() => _AskerState();
}
class _AskerState extends State<Asker> {
  int askNumer = 10;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),(){
      // ----
      setState(() {
        askNumer = 11;
        resetTimer();
      });
    });
  }
  void resetTimer(){
    Timer(Duration(seconds: 2), () {
      print("Wizard is waiting Next Quesion ");
      setState(() {
        askNumer = 10;
      });
    });
  }

  void getAnswer(){
    Flashlight.lightOn();
    Timer(Duration(seconds: 4), () {
      print("Wizard is Thinking ");
      Flashlight.lightOff();
      setState(() {
        askNumer = Random().nextInt(5);
        print(askNumer);
        resetTimer();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            ),
        onPressed: () async {
          setState(() {
            getAnswer();

          });
        },
             child: Container(
                 constraints: BoxConstraints.expand(),
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('images/ask$askNumer.jpg'),
                     fit: BoxFit.cover,
                   ),
                 ),),
          // Image(
            //   width: double.infinity,
            //   image: AssetImage('images/ask$askNumer.jpg'),
            // ),
        ),
      // ),
    );
  }
}













