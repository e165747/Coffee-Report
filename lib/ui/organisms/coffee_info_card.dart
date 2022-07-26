import 'package:coffee_report/state/coffee_info_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const defaultMessage = '--';

enum Menu { edit, delete }

// コーヒー情報リストを表示させる
class CoffeeInfoCard extends ConsumerWidget {
  CoffeeInfo coffeeInfo;
  CoffeeInfoCard({
    Key? key,
    required this.coffeeInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.flag,
          size: 40.0,
        ),
        title: Text(
          // '${name}',
          coffeeInfo.beansName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
            coffeeInfo.amount != null ? '残り ${coffeeInfo.amount} g' : '--'),
        trailing: PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                  const PopupMenuItem<Menu>(
                    value: Menu.edit,
                    child: Text('edit'),
                  ),
                  PopupMenuItem<Menu>(
                    value: Menu.edit,
                    child: Text('delete'),
                    onTap: () {
                      ref
                          .read(coffeeInfoListProvider.notifier)
                          .removeCoffeeInfo(coffeeInfo.id);
                    },
                  ),
                ]),
        onTap: () {
          print('tap');
        },
      ),
    );
  }
}
