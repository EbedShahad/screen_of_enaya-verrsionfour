import 'package:flutter/material.dart';
import 'package:screen_of_enaya/app/genral/style_color.dart';


InputDecoration buildInputDecoration(IconData icons, String hinttext) {
  return InputDecoration(
    
    hintText: hinttext,
    prefixIcon: Icon(icons, color: mainColor,),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color:mainColor, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color:mainColor,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: mainColor,
        width: 1.5,
      ),
    ),
  );
}
