import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_app/screens/explore_screen.dart';
import 'package:startup_app/screens/grocery_screen.dart';
import 'package:startup_app/screens/recipee_screens.dart';
import 'package:startup_app/models/tabs_manager.dart';
import 'package:startup_app/models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    // TODO: Replace with ExploreScreen
//Container(color: Colors.white),

ExploreScreen(),

    // TODO: Replace with RecipesScreen
    // Container(color: Colors.green),
    // Container(color: Colors.blue),
    RecipesScreen(),
   const GroceryScreen(),


  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 1
return Consumer<TabManager>(builder: (context, tabManager, child) {
  return Scaffold(
      appBar: AppBar(
          title: Text(
            'Fooderlich',
            style: Theme.of(context).textTheme.headline6,
          ),
      ),
      // 2
      // TODO: Replace body
body: IndexedStack(index: tabManager.selectedTab, children: pages),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context)
            .textSelectionTheme.selectionColor,
          // 3
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            // 4
            tabManager.goToTab(index);
          },
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Recipes',
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'To Buy',
            ),
          ],
      ),
    );
  },
);

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Fooderlich',
    //       style: Theme.of(context).textTheme.headline6,
    //     ),
    //   ),
    //   body: pages[_selectedIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
    //     currentIndex: _selectedIndex,
    //     onTap: _onItemTapped,
    //     items: <BottomNavigationBarItem>[
    //       const BottomNavigationBarItem(
    //         icon: Icon(Icons.explore),
    //         label: 'Explore',
    //       ),
    //       const BottomNavigationBarItem(
    //         icon: Icon(Icons.book),
    //         label: 'Recipes',
    //       ),
    //       const BottomNavigationBarItem(
    //         icon: Icon(Icons.list),
    //         label: 'To Buy',
    //       ),
    //     ],
    //   ),
    // );
  }
}
