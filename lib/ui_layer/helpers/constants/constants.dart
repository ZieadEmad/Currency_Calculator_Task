import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// long text for testing
const String kLongText =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum';

/// small text for testing
const String kTitle = 'Lorem Ipsum';

///#FFCA27
Color kSecondaryBackgroundColor = const Color(0xff1374ba);

/// main [grey] background color
Color? scaffoldBodyColor = Colors.grey[200];

/// app main color
// const Color defaultColor =  Color(0xffFFCA27);

const MaterialColor defaultColor = MaterialColor(
  0xff29334E,
  <int, Color>{
    50:  Color.fromRGBO(27 , 47 , 93, 0.9),
    100:  Color.fromRGBO(27 , 47 , 93, 0.8),
    200:   Color.fromRGBO(27 , 47 , 93, 0.7),
    300:  Color.fromRGBO(27 , 47 , 93, 0.6),
    400:   Color.fromRGBO(27 , 47 , 93, 0.5),
    500:   Color.fromRGBO(27 , 47 , 93, 0.4),
    600:   Color.fromRGBO(27 , 47 , 93, 0.3),
    700:  Color.fromRGBO(27 , 47 , 93, 0.2),
    800:  Color.fromRGBO(27 , 47 , 93, 0.1),
    900:   Color.fromRGBO(27 , 47 , 93, 0.0),
  },
);

/// String for null values or un definded
const String kNull = 'N/A';
