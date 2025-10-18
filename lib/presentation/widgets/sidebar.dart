import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Sidebar extends HookWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    //states
    final currentScreen = useState<int>(0);

    //functions

    return NavigationRail(
      selectedIndex: currentScreen.value,
      onDestinationSelected: (value) => currentScreen.value = value,
      minWidth: 120,
      labelType: NavigationRailLabelType.all,
      selectedLabelTextStyle: TextStyle(
        color: Color.fromARGB(255, 97, 97, 235),
      ),
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Inicio'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.stacked_bar_chart),
          label: Text('Ni Idea'),
        ),
      ],
    );
  }
}
