import 'package:coffee_report/ui/molecules/coffee_info_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCoffeeInfoDialog extends ConsumerWidget {
  const AddCoffeeInfoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      title: const Text('登録'),
      children: [
        Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: CoffeeInfoForm(
              isEntry: true,
            ))
      ],
    );
  }
}
