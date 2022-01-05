import 'package:flutter/material.dart';

import './categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const CaregoriesScreen(),
        ),
      ),
    );
  }
}
