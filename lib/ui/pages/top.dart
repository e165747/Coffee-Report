import 'package:coffee_report/ui/pages/coffee_info_detail.dart';
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
          fontFamily: 'Noto_Sans_JP'),
      home: const CoffeeList(
        title: 'Coffee Report',
      ),
      routes: <String, WidgetBuilder>{
        '/coffee-list': (BuildContext context) =>
            const CoffeeList(title: 'Coffee Report'),
        '/coffee-info-detail': (BuildContext context) =>
            const CoffeeInfoDetail(),
      },
    );
  }
}
