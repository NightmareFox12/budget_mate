import 'package:budget_mate/core/theme/colors.dart';
import 'package:flutter/material.dart';

final class BudgetMateLightTheme {
  final theme = ThemeData.light().copyWith(
    buttonTheme: ButtonThemeData().copyWith(),
    appBarTheme: AppBarTheme().copyWith(backgroundColor: budgetPrimary(false)),
    navigationRailTheme: NavigationRailThemeData().copyWith(
      backgroundColor: budgetPrimary(false),
    ),
  );
}
