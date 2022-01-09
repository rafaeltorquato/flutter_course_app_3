import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../utils/route_animations.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  final Map<Complexity, String> complexityLabelMap = const {
    Complexity.simple: 'Simple',
    Complexity.hard: 'Hard',
    Complexity.challenging: 'Challeging',
  };

  final Map<Affordability, String> affordabilityLabelMap = const {
    Affordability.affordable: 'Affordable',
    Affordability.luxurious: 'Luxurious',
    Affordability.pricey: 'Pricey',
  };

  const MealItem({
    required this.meal,
    Key? key,
  }) : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.push(
      context,
      RouteAnimations.fadeIn(
        (context, animation, secondaryAnimation) =>
            MealDetailScreen(meal: meal),
      ),
    );
  }

  String get complexityText {
    return complexityLabelMap[meal.complexity] ?? 'Default';
  }

  String get affordabilityText {
    return affordabilityLabelMap[meal.affordability] ?? 'Default';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColorLight,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            MealImage(meal),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work_outline),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MealImage extends StatelessWidget {
  final Meal meal;
  const MealImage(
    this.meal, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.network(
            meal.imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 15,
          right: 10,
          child: Container(
            width: 250,
            color: Colors.black38,
            child: Text(
              meal.title,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        )
      ],
    );
  }
}
