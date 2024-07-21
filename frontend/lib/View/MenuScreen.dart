import 'package:flutter/material.dart';

import 'DetailsScreen.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with SingleTickerProviderStateMixin {
  final List<Map<String, String>> _menuItems = [
    {'item': 'Latte', 'price': '\$30', 'image': 'latte.png'},
    {'item': 'Espresso', 'price': '\$30', 'image': 'espresso.png'},
    {'item': 'Black Coffee', 'price': '\$30', 'image': 'black_coffee.png'},
    {'item': 'Cold Coffee', 'price': '\$30', 'image': 'cold_coffee.png'},
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        elevation: 0,
        title: Text(
          "It's a Great Day for Coffee",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Container(
            color: Color(0xFF121212),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Hot Coffee'),
                Tab(text: 'Cold Coffee'),
                Tab(text: 'Cappuccino'),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMenuList(),
                _buildMenuList(),
                _buildMenuList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList() {
    return ListView.builder(
      itemCount: _menuItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset('assets/images/${_menuItems[index]['image']}'),
          title: Text(_menuItems[index]['item']!, style: TextStyle(color: Colors.white)),
          subtitle: Text(_menuItems[index]['price']!, style: TextStyle(color: Colors.grey)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(menuItem: _menuItems[index]),
              ),
            );
          },
        );
      },
    );
  }
}
