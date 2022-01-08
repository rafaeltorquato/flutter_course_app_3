import 'package:flutter/material.dart';

import 'category_item.dart';
import '../dummy/dummy_data.dart';

class CaregoriesGrid extends StatelessWidget {
  const CaregoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories.map((c) => CategoryItem(c)).toList(),
    );
  }
}
