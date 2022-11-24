import 'package:coffee_report/state/coffee_info_list.dart';
import 'package:coffee_report/ui/molecules/coffee_info_form.dart';
import 'package:coffee_report/ui/templates/main_template.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 詳細情報を表示
class CoffeeInfoDetail extends ConsumerWidget {
  const CoffeeInfoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ModalRoute.of(context)!.settings.arguments as CoffeeInfo;
    // TextField以外をタップした際，TextFieldのフォーカスを外す
    // https://qiita.com/tsukushibito/items/d7fde1d998a30292add7
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MainTemplate(
          title: info.beansName,
          // body: Container(color: Colors.white, child: CoffeeInfoForm()));
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CoffeeInfoForm(
              coffeeInfo: info,
              isEntry: false,
            ),
          )),
    );
  }
}
