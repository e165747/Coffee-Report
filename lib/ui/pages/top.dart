import 'package:coffee_report/ui/pages/coffee_list.dart';
import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        // body: const MyHomePage(title: 'Coffee Report'),
        body: const CoffeeList(title: 'Coffee Report'),
      ),
    );
  }
}
