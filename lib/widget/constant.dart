import 'package:flutter/material.dart';

const textInputDecoration= InputDecoration(
  hintStyle: TextStyle(color: Colors.black),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1.0)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0)
  )
);