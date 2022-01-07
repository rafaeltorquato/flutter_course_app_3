import 'package:flutter/material.dart';

import '../widgets/categories_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DeliMeals'),
        ),
        body: const Center(
          child: CaregoriesGrid(),
        ),
      ),
    );
  }
}
