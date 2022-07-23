import 'package:coffee_report/ui/organisms/coffee_info_card.dart';
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
      home: new Scaffold(
        body: const MyHomePage(title: 'Coffee Report'),
      ),
    );
  }
}

const defaultMessage = '--';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> coffeeInfo = [
    {
      'country': 'brazil',
      'description': 'Sweet and Bitter',
      'name': 'santos No.2',
    },
    {
      'country': 'ethiopia',
      // 'description': 'Sweet and Bitter',
      'name': 'moca',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: Colors.brown.withOpacity(0.8),
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return CoffeeInfoCard(
                cofeeInfo: coffeeInfo[index],
              );
            },
            itemCount: coffeeInfo.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
