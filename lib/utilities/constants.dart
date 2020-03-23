import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

final kInputBorder = new OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide.none,
);

final kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter city name",
  hintStyle: TextStyle(color: Colors.grey),
  border: kInputBorder,
);
