import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealfavorite = state.contains(meal);
    if (mealfavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
            return true;

    }
  }
}

final favoritwMealProvider =
    StateNotifierProvider<FavriteMealsNotifier, List<Meal>>((ref) {
  return FavriteMealsNotifier();
});
