import 'package:flutter/material.dart';

final class BudgetMateLightTheme {
  final theme = ThemeData.light().copyWith(
    buttonTheme: ButtonThemeData().copyWith(
      buttonColor: Color.fromARGB(255, 67, 255, 217),
    ),
    appBarTheme: AppBarTheme().copyWith(backgroundColor: Color(0xff034034)),
  );
}
