import 'package:budget_mate/theme/dark.dart';
import 'package:budget_mate/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fl_chart/fl_chart.dart';

class AppDart extends HookWidget {
  const AppDart({super.key});

  @override
  Widget build(BuildContext context) {
    //states
    final lightTheme = useState<bool>(false);

    Future<void> getUserTheme() async {
      final SharedPreferencesAsync prefs = SharedPreferencesAsync();
      final bool userTheme = (await prefs.getBool('userTheme')) ?? false;

      lightTheme.value = userTheme;
    }

    Future<void> saveUserTheme(bool light) async {
      final SharedPreferencesAsync prefs = SharedPreferencesAsync();
      await prefs.setBool('userTheme', light);
    }

    useEffect(() {
      getUserTheme();
      return null;
    }, []);

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
                onPressed: () async {
                  lightTheme.value = !lightTheme.value;
                  await saveUserTheme(lightTheme.value);
                },
                icon: Icon(lightTheme.value ? Icons.light_mode : Icons.bedtime),
              ),
            ),
          ],
        ),
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: 0,
              minWidth: 100,
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: TextStyle(
                color: Color.fromARGB(255, 97, 97, 235),
              ),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Inicio'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),

            Center(
              child: AspectRatio(
                aspectRatio: 2.0,
                child: LineChart(
                  LineChartData(
                    // titlesData: FlTitlesData(
                    //   show: true,
                    //   rightTitles: AxisTitles(
                    //     sideTitles: SideTitles(showTitles: false),
                    //   ),
                    // ),
                    lineBarsData: [
                      LineChartBarData(spots: [FlSpot(8, 2), FlSpot(4, 1)]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        //  Column(
        // children: [
        //   Row(
        //     children: [
        //       Container(
        //         width: 250,
        //         // height: MediaQuery.of(context).size.height,
        //         // color: Colors.grey[200],
        //         child: Column(
        //           children: [
        //             ListTile(title: Text('Inicio')),
        //             ListTile(title: Text('Gastos')),
        //             ListTile(title: Text('Configuración')),
        //           ],
        //         ),
        //       ),
        //       Card.filled(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(children: [Text('data')]),
        //         ),
        //       ),
        //     ],
        //   ),
        // ],
        // ),
      ),
    );
  }
}
