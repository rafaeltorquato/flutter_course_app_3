import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeNameWithArgs = '/meal-detail-screen';
  static const String argMeal = 'meal';

  static MealDetailScreen withArgs(Map args) {
    return MealDetailScreen(
      meal: args[argMeal] as Meal,
    );
  }

  final Meal meal;
  const MealDetailScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SectionTitle('Ingredients'),
            Section(
              child: Column(
                children: List.generate(
                    meal.ingredients.length,
                    (idx) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              margin: const EdgeInsets.all(3),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Text(meal.ingredients[idx]),
                              ),
                            ),
                            idx + 1 != meal.ingredients.length
                                ? const Divider()
                                : Container(),
                          ],
                        )).toList(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SectionTitle('Steps'),
            Section(
                child: Column(
              children: List.generate(
                  meal.steps.length,
                  (idx) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('${idx + 1}'),
                            ),
                            title: Text(meal.steps[idx]),
                          ),
                          if (idx + 1 != meal.steps.length) const Divider(),
                        ],
                      )).toList(),
            )),
          ],
        ),
      ),
    ));
  }
}

class Section extends StatelessWidget {
  final Widget child;

  const Section({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: child,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
