import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/catagories_grid_item.dart';
import 'package:meals/models/catagory.dart';
import 'package:meals/models/meal.dart';

class CatagoriesScreen extends StatelessWidget {
  CatagoriesScreen({super.key,required this.availabelMeals});
  
  final List<Meal> availabelMeals;

  void _selectedcatgory(BuildContext context, Category catagory) {
    final filteredcatagory = availabelMeals
        .where((meal) => meal.categories.contains(catagory.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MealsScreen(
                title: catagory.title,
                meals: filteredcatagory)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final catagory in availableCategories)
          CatagoriesGridItem(
              catagory: catagory,
              selectedcat: () {
                _selectedcatgory(context, catagory);
              }),
      ],
    );
  }
}
