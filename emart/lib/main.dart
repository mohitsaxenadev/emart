import 'package:flutter/material.dart';

//own imports
import 'package:emart/components/pages/login.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.pink
    ),
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

