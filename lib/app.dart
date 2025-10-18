import 'package:budget_mate/core/theme/dark.dart';
import 'package:budget_mate/core/theme/light.dart';
import 'package:budget_mate/presentation/widgets/sidebar.dart';
import 'package:budget_mate/presentation/widgets/top_app_bar.dart';
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

    //functions
    Future<void> getUserTheme() async {
      final SharedPreferencesAsync prefs = SharedPreferencesAsync();
      final bool userTheme = (await prefs.getBool('userTheme')) ?? false;

      lightTheme.value = userTheme;
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
        appBar: BudgetTopAppBar(
          isLightTheme: lightTheme.value,
          changeTheme: () => lightTheme.value = !lightTheme.value,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sidebar(),
            const VerticalDivider(thickness: 1, width: 1),

            //main content
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Column(
                        spacing: 12,
                        children: [
                          Text(
                            'Gastos de la última semana',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                            height: 280,
                            child: AspectRatio(
                              aspectRatio: 2,
                              child: LineChart(
                                LineChartData(
                                  titlesData: FlTitlesData(
                                    show: true,
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 1,
                                        getTitlesWidget: (value, meta) {
                                          switch (value.toInt()) {
                                            case 0:
                                              return Text('L');
                                            case 1:
                                              return Text('M');
                                            case 2:
                                              return Text('M');
                                            case 3:
                                              return Text('J');
                                            case 4:
                                              return Text('V');
                                            case 5:
                                              return Text('S');
                                            case 6:
                                              return Text('D');
                                            default:
                                              return Text('');
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: [
                                        FlSpot(0, 1),
                                        FlSpot(1, 2),
                                        FlSpot(2, 3),
                                        FlSpot(3, 4),
                                        FlSpot(4, 5),
                                        FlSpot(5, 6),
                                        FlSpot(6, 7),
                                      ],
                                      isCurved: true,
                                      barWidth: 6,
                                      curveSmoothness: 0.2,

                                      // preventCurveOverShooting: true
                                      belowBarData: BarAreaData(
                                        show: true,
                                        // applyCutOffY: true,
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 121, 127, 222),
                                            Color.fromARGB(255, 80, 89, 221),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],

                                  extraLinesData: ExtraLinesData(
                                    horizontalLines: [
                                      HorizontalLine(
                                        y: 4,
                                        color: Color.fromARGB(
                                          255,
                                          129,
                                          192,
                                          241,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
