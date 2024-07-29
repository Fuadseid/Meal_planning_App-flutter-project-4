import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/widgets/meal_item.dart';

// ignore: must_be_immutable
class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, this.title, required this.meals,required this.onToggleFavorite});
  final String? title;
  List<Meal> meals;
  void Function(Meal meal) onToggleFavorite;
  void selectmeal(Meal meal, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MealDetailScreen(onToggleFavorite: onToggleFavorite,meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onslectedMeal: (meal) {
          selectmeal(meal, context);
        },
      ),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'opps There is no food in this catagory',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Please Select other catagory ',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
