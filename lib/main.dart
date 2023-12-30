import 'package:flutter/material.dart';
import 'splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.white, // AppBar ikon rengi
          ), toolbarTextStyle: const TextTheme(
            headline6: TextStyle(
              color: Colors.white, // AppBar metin rengi
              fontSize: 18.0,
            ),
          ).bodyText2, titleTextStyle: const TextTheme(
            headline6: TextStyle(
              color: Colors.white, // AppBar metin rengi
              fontSize: 18.0,
            ),
          ).headline6,
        ),
    ));
  }
}
