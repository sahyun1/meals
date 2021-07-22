import 'package:flutter/material.dart';
import 'favourites_screen.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({ Key? key }) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavouritesScreen(),
      'title': 'Favourites',
    }
  ];

  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        // type: BottomNavigationBarType.shifting, //shifting animation
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: const Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: const Text('Favourites'),
          )
        ],
      ),
    );
    // this is right below of appbar
    // return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //         appBar: AppBar(
    //           title: Text('Meals'),
    //           bottom: TabBar(
    //             tabs: [
    //               Tab(
    //                 icon: Icon(Icons.category),
    //                 text: 'Categories',
    //               ),
    //               Tab(
    //                 icon: Icon(Icons.star),
    //                 text: 'Favourites',
    //               )
    //             ],
    //           ),
    //         ),
    //         body: TabBarView(
    //           children: [
    //             CategoriesScreen(),
    //             FavouritesScreen(),
    //           ],
    //         )));
  }
}
