import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'SignUpScreen.dart';


class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: Center(

            ),
            bottom: TabBar(
              indicatorColor: Colors.blueAccent,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'SignUp'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            LoginScreen(),
            SignUpScreen(),
          ],
        ),
      ),
    );
  }
}
