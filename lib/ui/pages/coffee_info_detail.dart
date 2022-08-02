import 'package:coffee_report/ui/templates/main_template.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 詳細情報を表示
class CoffeeInfoDetail extends ConsumerWidget {
  const CoffeeInfoDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainTemplate(title: '詳細', body: Container());
  }
}
