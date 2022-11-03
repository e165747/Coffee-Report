import 'package:coffee_report/state/coffee_info_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 情報フォームを作成
// https://api.flutter.dev/flutter/widgets/Form-class.html
class CoffeeInfoForm extends StatefulHookConsumerWidget {
  const CoffeeInfoForm({Key? key, this.coffeeInfo}) : super(key: key);

  final CoffeeInfo? coffeeInfo;

  @override
  CoffeeInfoFormState createState() => CoffeeInfoFormState();
}

// riverpodでフォームのバリデーションを扱う場合
// https://zenn.dev/joo_hashi/articles/ef200c2078e993
class CoffeeInfoFormState extends ConsumerState<CoffeeInfoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: '豆の種類'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '豆の種類を入力してください';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '産出国'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '産出国を入力してください';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '評価'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '評価を入力してください';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '豆の残量'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '豆の残量を入力してください';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'メモ'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'メモを入力してください';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    ));
  }
}
