import 'package:coffee_report/state/coffee_info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              maxLength: 50,
              decoration: const InputDecoration(
                  icon: Icon(Icons.coffee), labelText: '豆の種類'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '豆の種類を入力してください';
                }
                return null;
              },
            ),
            TextFormField(
              maxLength: 20,
              decoration: const InputDecoration(
                  icon: Icon(Icons.flag), labelText: '産出国'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '産出国を入力してください';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: Icon(Icons.star), labelText: '評価'),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 5,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '評価を入力してください';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: Icon(Icons.scale), labelText: '豆の残量'),
              inputFormatters: [
                // FilteringTextInputFormatter.digitsOnly,
                // 小数のみ許可するよう修正ちゅう（まだ途中）
                FilteringTextInputFormatter.allow(RegExp(r"\d+([\.]\d+)?")),
              ],
              maxLength: 5,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return '豆の残量を入力してください';
                }
                return null;
              },
            ),
            TextFormField(
              maxLength: 300,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  icon: Icon(Icons.textsms), labelText: 'メモ'),
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
