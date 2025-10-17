import 'package:budget_mate/theme/dark.dart';
import 'package:budget_mate/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppDart extends HookWidget {
  const AppDart({super.key});

  @override
  Widget build(BuildContext context) {
    //states
    final lightTheme = useState<bool>(false);

    return MaterialApp(
      title: 'App durisima',
      darkTheme: BudgetMateDarkTheme().theme,
      theme: BudgetMateLightTheme().theme,
      themeMode: lightTheme.value ? ThemeMode.light : ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buget Mate'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton.filled(
                onPressed: () => lightTheme.value = !lightTheme.value,
                icon: Icon(lightTheme.value ? Icons.light_mode : Icons.bedtime),
              ),
            ),
          ],
        ),
        drawer: Drawer(backgroundColor: Color(0xff034034)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.create),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Card.filled(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [Text('data')]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
