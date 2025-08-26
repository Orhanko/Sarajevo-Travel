import 'package:flutter/material.dart';
import 'package:sarajevo_travel/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

const Color kMainColor = Color(0xFFD85151);

class MyApp extends StatelessWidget {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Inter',
    colorScheme: ColorScheme.light(primary: kMainColor, onPrimary: Color(0xFF4E5562)),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 2,
      shadowColor: Colors.grey.withAlpha(150),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Inter',
    colorScheme: ColorScheme.dark(primary: kMainColor, onPrimary: Color(0xFF4E5562)),
    scaffoldBackgroundColor: Color(0xFF131313),
    appBarTheme: AppBarTheme(titleTextStyle: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, // automatski bira prema OS postavkama
      home: const MainNavigation(),
    );
  }
}
