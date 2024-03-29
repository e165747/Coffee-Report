import 'package:coffee_report/state/coffee_info_list.dart';
import 'package:coffee_report/ui/templates/main_template.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../molecules/coffee_info_form.dart';
import '../molecules/coffee_picture.dart';

// 詳細情報を表示
class CoffeeInfoDetail extends ConsumerWidget {
  const CoffeeInfoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ModalRoute.of(context)!.settings.arguments as CoffeeInfo;
    return MainTemplate(
        title: info.beansName,
        // body: Container(color: Colors.white, child: CoffeeInfoForm()));
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CoffeeInfoForm(
                  coffeeInfo: info,
                  isEntry: false,
                ),
                const CoffeePicture(),
              ],
            ),
          ),
        ));
  }
}
