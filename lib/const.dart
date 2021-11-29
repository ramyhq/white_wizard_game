import 'package:flutter/material.dart';

const kTextStyle1 =  TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w500,
  fontFamily: 'Rakkas',
  color: Colors.black54,


);
double shadowNumber = 10.0;
double shadowBlur = 30.0;
final kTextStyle2 =  TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.w800,
  fontFamily: 'Rakkas',
  color: Color(0xffc17542),
  // foreground: Paint()
  //   ..style = PaintingStyle.stroke
  //   ..strokeWidth = 6
  //   ..color = Colors.blue,

      shadows: [
        Shadow( // bottomLeft
            blurRadius: shadowBlur,
            offset: Offset(-shadowNumber, -shadowNumber),
            color: Colors.black
        ),
        Shadow( // bottomRight
            blurRadius: shadowBlur,
            offset: Offset(shadowNumber, -shadowNumber),
            color: Colors.black
        ),
        Shadow( // topRight
            blurRadius: shadowBlur,
            offset: Offset(shadowNumber, shadowNumber),
            color: Colors.black
        ),
        Shadow( // topLeft
            blurRadius: shadowBlur,
            offset: Offset(-shadowNumber, shadowNumber),
            color: Colors.black
        ),
      ]
);


class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

}


