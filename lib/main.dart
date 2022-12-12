import 'package:coffee_report/ui/pages/top.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: Top()));
}
