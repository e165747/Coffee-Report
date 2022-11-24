import 'dart:async';

import 'package:coffee_report/state/coffee_info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 情報登録or更新フォーム
/// 参考
/// https://api.flutter.dev/flutter/widgets/Form-class.html
///
/// CoffeeInfo coffeeInfo : 登録．更新する情報
/// bool isEntry : trueの場合は新規登録，falseは更新
class CoffeeInfoForm extends StatefulHookConsumerWidget {
  const CoffeeInfoForm({Key? key, this.coffeeInfo, required this.isEntry})
      : super(key: key);

  final CoffeeInfo? coffeeInfo;
  final bool isEntry;

  @override
  CoffeeInfoFormState createState() => CoffeeInfoFormState();
}

// riverpodでフォームのバリデーションを扱う場合
// https://zenn.dev/joo_hashi/articles/ef200c2078e993
class CoffeeInfoFormState extends ConsumerState<CoffeeInfoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextFormFieldのinitialValueとcontrollerは同時に利用できないため注意
  //  参考: https://teratail.com/questions/358948
  late TextEditingController _beansNameController;
  late TextEditingController _countryController;
  late TextEditingController _evaluationController;
  late TextEditingController _amountController;
  late TextEditingController _memoController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _beansNameController =
        TextEditingController(text: widget.coffeeInfo?.beansName);

    String? initialCountry = '';
    if (widget.coffeeInfo?.country != null) {
      initialCountry = widget.coffeeInfo?.country;
    }
    _countryController = TextEditingController(text: initialCountry);

    String? initialEvaluation = '';
    if (widget.coffeeInfo?.evaluation?.toString() != null) {
      initialEvaluation = widget.coffeeInfo?.evaluation.toString();
    }

    _evaluationController = TextEditingController(text: initialEvaluation);

    String? initialAmount = '';
    if (widget.coffeeInfo?.amount?.toString() != null) {
      initialAmount = widget.coffeeInfo?.amount.toString();
    }
    _amountController = TextEditingController(text: initialAmount);
    String? initialMemo = '';
    if (widget.coffeeInfo?.memo != null) {
      initialMemo = widget.coffeeInfo?.memo;
    }
    _memoController = TextEditingController(text: initialMemo);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextFormField(
                        controller: _beansNameController,
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
                        controller: _countryController,
                        maxLength: 20,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.flag), labelText: '産出国'),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            // return '産出国を入力してください';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _evaluationController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.star), labelText: '評価(100点満点)'),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLength: 3,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            // return '評価を入力してください';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
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
                            // return '豆の残量を入力してください';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _memoController,
                        maxLength: 300,
                        maxLines: null,
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
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        if (widget.isEntry) {
                          ref
                              .read(coffeeInfoListProvider.notifier)
                              .addCoffeeInfo(
                                beansName: _beansNameController.text,
                                country: _countryController.text,
                                evaluation: _evaluationController.text != ''
                                    ? double.parse(_evaluationController.text)
                                    : null,
                                amount: _amountController.text != ''
                                    ? int.parse(_amountController.text)
                                    : null,
                              );
                        } else {
                          ref
                              .read(coffeeInfoListProvider.notifier)
                              .updateCoffeeInfo(CoffeeInfo(
                                  id: widget.coffeeInfo!.id,
                                  beansName: _beansNameController.text,
                                  evaluation: _evaluationController.text != ''
                                      ? double.parse(_evaluationController.text)
                                      : null,
                                  amount: _amountController.text != ''
                                      ? int.parse(_amountController.text)
                                      : null,
                                  memo: _memoController.text));
                        }

                        // ダイアログを３秒後に自動で閉じる
                        Timer _timer = Timer(Duration(seconds: 3), () {
                          Navigator.of(context).pop();
                        });

                        await showDialog(
                            context: context,
                            builder: (_) {
                              return const AlertDialog(
                                title: Text('更新しました'),
                              );
                            });
                        if (_timer.isActive) {
                          _timer.cancel();
                        }
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
              ),
            ],
          ),
        ));
  }
}
