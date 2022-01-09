import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FilterOptionItem(
            title: 'Gluten-free',
            subtitle: 'Only includes gluten-free meals.',
            value: _glutenFree,
            onChanged: (newValue) {
              setState(() => _glutenFree = newValue);
            },
          ),
          FilterOptionItem(
            title: 'Lactose-free',
            subtitle: 'Only includes lactose-free meals.',
            value: _lactoseFree,
            onChanged: (newValue) {
              setState(() => _lactoseFree = newValue);
            },
          ),
          FilterOptionItem(
            title: 'Vegan',
            subtitle: 'Only includes vegan meals.',
            value: _vegan,
            onChanged: (newValue) {
              setState(() => _vegan = newValue);
            },
          ),
          FilterOptionItem(
            title: 'Vegetarian',
            subtitle: 'Only includes vegetarian meals.',
            value: _vegetarian,
            onChanged: (newValue) {
              setState(() => _vegetarian = newValue);
            },
          ),
        ],
      ),
    ));
  }
}

class FilterOptionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChanged;

  const FilterOptionItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
