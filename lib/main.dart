import 'package:calculator/calc.dart';
import 'package:flutter/material.dart';
// final ThemeData _appTheme = _buildAppTheme();

// ThemeData _buildAppTheme() {
//   final ThemeData base = ThemeData.light();
//   return base.copyWith(
//     brightness: Brightness.light,
//     backgroundColor: Colors.cyan,
//     buttonColor: Colors.orange,
//     primaryColor: Colors.orange,
//   );
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: _appTheme,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   backgroundColor: Colors.orange,
      //   primaryColor: Colors.yellow,
      //   textTheme:TextTheme(
      //     body1: TextStyle(
      //       fontSize: 34.0,
      //     )
      //   )
      // ),
      home: Quiz(),
    );
  }
}
