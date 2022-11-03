import 'package:coffee_report/state/coffee_info_list.dart';
import 'package:coffee_report/ui/atoms/add_coffee_info_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../organisms/coffee_info_card.dart';

// 登録済みコーヒー情報一覧を表示させる
class CoffeeList extends ConsumerWidget {
  const CoffeeList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CoffeeInfo> coffeeInfoList = ref.watch(coffeeInfoListProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown.withOpacity(0.8),
        title: Text(title),
      ),
      body: Container(
        color: Colors.brown.withOpacity(0.2),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return CoffeeInfoCard(
                  coffeeInfo: coffeeInfoList[index],
                );
              },
              itemCount: coffeeInfoList.length,
            ),
          ),
        ),
      ),
      floatingActionButton: const AddCoffeeInfoButton(),
    );
  }
}
