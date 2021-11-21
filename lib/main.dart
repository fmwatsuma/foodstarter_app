import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_app/models/grocery_manager.dart';
import 'package:startup_app/screens/fooderlich_theme.dart';
import 'package:startup_app/screens/home.dart';
import 'package:startup_app/models/tabs_manager.dart';
import 'package:startup_app/models/models.dart';


void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      // replace home with multiprovider
      // 1
home: MultiProvider(
  providers: [
    // 2
    ChangeNotifierProvider(create: (context) => TabManager()),
    // TODO 10: Add GroceryManager Provider
    ChangeNotifierProvider(create: (context) => GroceryManager()),

  ],
  child: const Home(),
),

    );
  }
}
