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
    // 一旦確認ダイアログを表示させないよう修正
    // Future onRemoveInfo() async {
    //   return await showDialog(
    //     context: context,
    //     builder: (_) {
    //       return AlertDialog(
    //         title: const Text('削除してもよろしいですか？'),
    //         content: const Text('削除したデータは元に戻すことができません'),
    //         actions: <Widget>[
    //           TextButton(
    //               onPressed: () {
    //                 ref
    //                     .read(coffeeInfoListProvider.notifier)
    //                     .removeCoffeeInfo(coffeeInfo.id);
    //                 Navigator.of(context).pop();
    //               },
    //               child: const Text('OK'))
    //         ],
    //       );
    //     },
    //   );
    // }
    Future onRemoveInfo() async {
      ref.read(coffeeInfoListProvider.notifier).removeCoffeeInfo(coffeeInfo.id);
    }

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        onRemoveInfo();
      },
      background: Container(
        padding: const EdgeInsets.only(right: 16),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        child: ListTile(
          leading: const Icon(
            Icons.flag,
            size: 40.0,
          ),
          title: Text(
            // '${name}',
            coffeeInfo.beansName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                      value: Menu.delete,
                      child: const Text('delete'),
                      onTap: () {
                        // callback後に処理しないとダイアログが開かない
                        // https://stackoverflow.com/questions/69568862/flutter-showdialog-is-not-shown-on-popupmenuitem-tap
                        // WidgetsBinding.instance.addPostFrameCallback((_) {
                        onRemoveInfo();
                        // });
                      },
                    ),
                  ]),
          onTap: () {
            print('tap');
            Navigator.of(context)
                .pushNamed('/coffee-info-detail', arguments: coffeeInfo);
          },
        ),
      ),
    );
  }
}
