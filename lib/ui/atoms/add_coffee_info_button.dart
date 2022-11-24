import 'package:coffee_report/ui/organisms/add_coffee_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCoffeeInfoButton extends ConsumerWidget {
  const AddCoffeeInfoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressedAdd() {
      showDialog(
          context: context,
          builder: (_) {
            return AddCoffeeInfoDialog();
          });
    }

    return FloatingActionButton(
      onPressed: onPressedAdd,
      tooltip: 'データを追加',
      child: const Icon(Icons.add),
    );
  }
}
