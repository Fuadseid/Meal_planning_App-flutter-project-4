import 'package:flutter/material.dart';
import 'package:meals/screens/catagories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';

class TapScreen extends StatefulWidget {
  const TapScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TapScreen> {
  int _selectedpageIndex = 0;
  void _selectpage(int index) {
    setState(() {
      _selectedpageIndex = index;
    });
  }

  void _showmessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  List<Meal> _favoriteMeals = [];
  void _toggleMealFavorite(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showmessage('Meal is no longer a Favorite.');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showmessage('Marked as a Favorite !');
      });
    }
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filtered') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (ctx) => FiltersScreen(),
      ));

      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage = CatagoriesScreen(
      onToggleFavorite: _toggleMealFavorite,
    );
    var activepagetitle = 'Catagories';
    if (_selectedpageIndex == 1) {
      activepage = MealsScreen(
          onToggleFavorite: _toggleMealFavorite, meals: _favoriteMeals);
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
