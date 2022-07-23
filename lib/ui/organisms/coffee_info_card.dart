import 'package:flutter/material.dart';

const defaultMessage = '--';

class CoffeeInfoCard extends StatelessWidget {
  Map<String, String> cofeeInfo;
  CoffeeInfoCard({
    Key? key,
    required this.cofeeInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.flag,
          size: 40.0,
        ),
        title: Text(
          // '${name}',
          '${cofeeInfo['name'] ?? defaultMessage}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text('${cofeeInfo['description'] ?? defaultMessage}'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('tap');
        },
      ),
    );
  }
}
