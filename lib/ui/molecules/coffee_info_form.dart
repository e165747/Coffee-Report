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
        key: _formKey,
        child: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextFormField(
                    maxLength: 50,
                    initialValue: widget.coffeeInfo?.beansName,
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
                    initialValue: widget.coffeeInfo?.country,
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
                    initialValue: widget.coffeeInfo?.evaluation.toString(),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.star), labelText: '評価(100点満点)'),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 3,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return '評価を入力してください';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    initialValue: widget.coffeeInfo?.amount.toString(),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.scale), labelText: '豆の残量(g)'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      // 小数のみ許可するよう修正中(まだ途中)
                      // FilteringTextInputFormatter.allow(RegExp(r"\d+([\.]\d+)?")),
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
                    initialValue: widget.coffeeInfo?.memo,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.textsms), labelText: 'メモ'),
                    validator: (String? value) {
                      // if (value == null || value.isEmpty) {
                      //   return 'メモを入力してください';
                      // }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          // ref.read(coffeeInfoListProvider.notifier).updateCoffeeInfo(CoffeeInfo(beansName: beansName, id: id))
                          print('test');
                          // Process data.
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('エラーが発生しました。入力した項目をご確認ください。'),
                              action: SnackBarAction(
                                label: 'OK',
                                textColor: Colors.blue,
                                onPressed: () {},
                              ),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
