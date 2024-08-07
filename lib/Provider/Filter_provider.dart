import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Provider/meals_provider.dart';
enum Filter {
  glutenfree,
  lactosefree,
  vegeterian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenfree: false,
          Filter.lactosefree: false,
          Filter.vegeterian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setfilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filteredProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
        (ref) => FilterNotifier());
final filteredMealprovider = Provider((ref) {
      final meals = ref.watch(meal_provider);
      final activefilter =  ref.watch(filteredProvider);
return meals.where((meal) {
  
      if (activefilter[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activefilter[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activefilter[Filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (activefilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();




});
