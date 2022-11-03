import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/coffee_info_list.dart';

class AddCoffeeInfoButton extends ConsumerWidget {
  const AddCoffeeInfoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressedAdd() {
      ref.read(coffeeInfoListProvider.notifier).addCoffeeInfo(CoffeeInfo(
          beansName: 'coffee5',
          id: '6',
          evaluation: 5.0,
          memo: 'test',
          amount: 200));
    }

    return FloatingActionButton(
      onPressed: onPressedAdd,
      tooltip: 'データを追加',
      child: const Icon(Icons.add),
    );
  }
}
