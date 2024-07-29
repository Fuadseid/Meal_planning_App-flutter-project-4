import 'package:flutter/material.dart';
import 'package:meals/models/catagory.dart';

class CatagoriesGridItem extends StatelessWidget {
  const CatagoriesGridItem({super.key, required this.catagory,required this.selectedcat});
  final Category catagory;
  final void Function() selectedcat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedcat,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              catagory.color.withOpacity(0.55),
              catagory.color.withOpacity(0.9),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          catagory.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
