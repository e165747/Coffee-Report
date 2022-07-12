import 'package:flutter/material.dart';

class CoffeeInfoCard extends StatelessWidget {
  String name;
  String description;
  String country;
  CoffeeInfoCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.brown.withOpacity(0.1),
      color: Colors.white.withOpacity(0.75),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(height: 40, child: Icon(Icons.flag)),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        '${name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        child: Text('${description}',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7)))),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(height: 40, child: Icon(Icons.navigate_next)),
            ),
          )
        ],
      ),
    );
  }
}
