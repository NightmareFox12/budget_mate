import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BudgetTopAppBar extends HookWidget implements PreferredSizeWidget {
  final bool isLightTheme;
  final Function() changeTheme;

  const BudgetTopAppBar({
    super.key,
    required this.isLightTheme,
    required this.changeTheme,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> saveUserTheme(bool light) async {
      final SharedPreferencesAsync prefs = SharedPreferencesAsync();
      await prefs.setBool('userTheme', light);
    }

    return AppBar(
      title: Text('Budget Mate'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton.filled(
            onPressed: () async {
              changeTheme();
              await saveUserTheme(isLightTheme);
            },
            icon: Icon(!isLightTheme ? Icons.light_mode : Icons.bedtime),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
