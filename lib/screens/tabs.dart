import 'package:flutter/material.dart';
import 'package:meals/screens/catagories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Provider/meals_provider.dart';
import 'package:meals/Provider/favoraite_provider.dart';
import 'package:meals/Provider/Filter_provider.dart';

const KinitialFIlter = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegeterian: false,
  Filter.vegan: false,
};

class TapScreen extends ConsumerStatefulWidget {
  const TapScreen({super.key});
  @override
  ConsumerState<TapScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TapScreen> {
  int _selectedpageIndex = 0;
  void _selectpage(int index) {
    setState(() {
      _selectedpageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filtered') {
      await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (ctx) => FiltersScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availablemeal = ref.watch(filteredMealprovider);
    Widget activepage = CatagoriesScreen(
      availabelMeals: availablemeal,
    );
    var activepagetitle = 'Catagories';
    if (_selectedpageIndex == 1) {
      final favMeals = ref.watch(favoritwMealProvider);

      activepage = MealsScreen(meals: favMeals);
      activepagetitle = 'Your favorite';
    }
    return Scaffold(
      drawer: MainDrawer(
        onSelectedScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedpageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}
