import 'package:flutter/material.dart';
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

  void selectMeal() {}

  String get complexityText {
    return complexityLabelMap[meal.complexity] ?? 'Default';
  }

  String get affordabilityText {
    return affordabilityLabelMap[meal.affordability] ?? 'Default';
  }

  const MealItem({
    required this.meal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
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
            ),
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
