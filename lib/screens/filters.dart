import 'package:flutter/material.dart';
import 'package:meals/Provider/Filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
   FiltersScreen({ super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters = ref.watch(filteredProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filteres '),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activefilters[Filter.glutenfree]!,
            onChanged: (ischecked) {
              ref
                  .read(filteredProvider.notifier)
                  .setfilter(Filter.glutenfree, ischecked);
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
            value: activefilters[Filter.lactosefree]!,
            onChanged: (ischecked) {
              ref
                  .read(filteredProvider.notifier)
                  .setfilter(Filter.lactosefree, ischecked);
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
           value: activefilters[Filter.vegeterian]!,
            onChanged: (ischecked) {
              ref
                  .read(filteredProvider.notifier)
                  .setfilter(Filter.vegeterian, ischecked);
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
           value: activefilters[Filter.vegan]!,
            onChanged: (ischecked) {
              ref
                  .read(filteredProvider.notifier)
                  .setfilter(Filter.vegan, ischecked);
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
    );
  }
}
