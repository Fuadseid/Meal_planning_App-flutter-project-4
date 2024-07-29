import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/screens/tabs.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

enum Filter {
  glutenfree,
  lactosefree,
  vegeterian,
  vegan,
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenfreeFilterset = false;
  var _lactosefreeFilterset = false;
  var _vegeterian = false;
  var _Vegan = false;

  @override
  void initState() {

    super.initState();
  
   _gluttenfreeFilterset =widget.currentFilter[Filter.glutenfree]!;
 _lactosefreeFilterset =widget.currentFilter[Filter.lactosefree]!;
 _vegeterian =widget.currentFilter[Filter.vegeterian]!;
 _Vegan =widget.currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filteres '),
      ),
      // drawer: MainDrawer(onSelectedScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'Meal') {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (ctx) => const TapScreen()));
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenfree: _gluttenfreeFilterset,
            Filter.lactosefree: _lactosefreeFilterset,
            Filter.vegeterian: _vegeterian,
            Filter.vegan: _Vegan,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenfreeFilterset,
              onChanged: (ischecked) {
                setState(() {
                  _gluttenfreeFilterset = ischecked;
                });
              },
              title: Text(
                'Glutten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only Include Gluteen-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34),
            ),
            SwitchListTile(
              value: _lactosefreeFilterset,
              onChanged: (ischecked) {
                setState(() {
                  _lactosefreeFilterset = ischecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only Include Lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34),
            ),
            SwitchListTile(
              value: _vegeterian,
              onChanged: (ischecked) {
                setState(() {
                  _vegeterian = ischecked;
                });
              },
              title: Text(
                'Vegitarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only Include Vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34),
            ),
            SwitchListTile(
              value: _Vegan,
              onChanged: (ischecked) {
                setState(() {
                  _Vegan = ischecked;
                });
              },
              title: Text(
                'Vegan-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only Include Vegan-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34),
            ),
          ],
        ),
      ),
    );
  }
}
