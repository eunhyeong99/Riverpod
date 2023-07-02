import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/layout/riverpod/state_notifier_provider.dart';
import 'package:project/model/shopping_item_model.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterstate = ref.watch(filterProvider);
    final shoppingListstate = ref.watch(shoppingListProvider);

    if (filterstate == FilterState.all) {
      return shoppingListstate;
    }
    return shoppingListstate
        .where((element) => filterstate == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
    return [];
  },
);

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider((ref) => FilterState.all);
