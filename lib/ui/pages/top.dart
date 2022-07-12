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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: new Scaffold(
        body: const MyHomePage(title: 'Coffee Report'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
      'description': 'Sweet and Bitter',
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
          child: Column(
            children: <Widget>[
              Column(
                children: coffeeInfo
                    .map((Map<String, String> e) => CoffeeInfoCard(
                        name: '${e['name']}',
                        description: '${e['description']}',
                        country: '${e['country']}'))
                    .toList(),
              ),
            ],
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
