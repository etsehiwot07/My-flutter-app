import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class constant{
  static Color textColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xFF50533B)
        : Color(0xFF50533B);
  }
  static Color text2Color(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        :  Colors.white;
  }
  static Color text3Color(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Color(0xFFA3B18A);
  }
  static Color text4Color(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xFF45472D)
        : Color(0xFFF6F1E9);
  }
  static final aqua = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  static final aqua2 = TextStyle(
    fontSize: 25,
    color: Colors.white,
  );

  static final txt = TextStyle(
    fontSize: 15,
    color: Colors.white,
  );

  static final dllr = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final perfume_text = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static final e_button = TextStyle(
    fontSize: 20,
  );
  static final basket = TextStyle(
    fontSize: 25,
    color: Color(0xFF6B705C),
    fontWeight: FontWeight.bold,
    fontFamily: 'Raleway',
  );

  static final drawer = TextStyle(
      color: Colors.white, fontSize: 24
  );
  static final featured = TextStyle(
    fontSize: 25,
    color: Color(0xFF5F6F52),
    fontFamily: 'PlayfairDisplay',
    fontWeight: FontWeight.bold
  );

  static final categories = TextStyle(
    fontSize: 35,
    color:Color(0xFF2F3A32),
    fontFamily: 'PlayfairDisplay',
    fontWeight: FontWeight.bold
  );
  static final bottomtxt = TextStyle(
    fontSize: 17,
    color:Color(0xFFE7E8EF),
    fontFamily: 'Raleway',
  );
  static final aqua3 = TextStyle(
    fontSize: 21,
    color: Colors.white,
    fontFamily: 'PlayfairDisplay',
  );
  static final aqua4 = TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontFamily: 'CormorantGaramond',
    fontWeight: FontWeight.bold,
  );
}