import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/meal_filter_cubit.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealFilterCubit, MealFilterState>(
      builder: (context, state) {
        MealFilterCubit cubit = context.read<MealFilterCubit>();
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
                value: state.filter.isGlutenFree,
                onChanged: (newValue) => cubit.changedGlutenFree(newValue),
              ),
              FilterOptionItem(
                title: 'Lactose-free',
                subtitle: 'Only includes lactose-free meals.',
                value: state.filter.isLactoseFree,
                onChanged: (newValue) => cubit.changedLactoseFree(newValue),
              ),
              FilterOptionItem(
                title: 'Vegan',
                subtitle: 'Only includes vegan meals.',
                value: state.filter.isVegan,
                onChanged: (newValue) => cubit.changedVegan(newValue),
              ),
              FilterOptionItem(
                title: 'Vegetarian',
                subtitle: 'Only includes vegetarian meals.',
                value: state.filter.isVegetarian,
                onChanged: (newValue) => cubit.changedVegetarian(newValue),
              ),
            ],
          ),
        ));
      },
    );
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
