import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/catagories_grid_item.dart';
import 'package:meals/models/catagory.dart';
import 'package:meals/models/meal.dart';

class CatagoriesScreen extends StatefulWidget {
  CatagoriesScreen({super.key, required this.availabelMeals});

  final List<Meal> availabelMeals;

  @override
  State<CatagoriesScreen> createState() => _CatagoriesScreenState();
}

class _CatagoriesScreenState extends State<CatagoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: const Duration(milliseconds: 300));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _selectedcatgory(BuildContext context, Category catagory) {
    final filteredcatagory = widget.availabelMeals
        .where((meal) => meal.categories.contains(catagory.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MealsScreen(title: catagory.title, meals: filteredcatagory)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) => SlideTransition(position: 
      
        Tween(
          begin:const Offset(0, 0.3) ,
          end:const Offset(0, 0) ,
        ).animate(CurvedAnimation(parent: _animationController,curve: Curves.easeInOut)),
        child: child,
      
      
      ),
    );
  }
}
