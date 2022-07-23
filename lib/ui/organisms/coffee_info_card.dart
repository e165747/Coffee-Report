import 'package:coffee_report/state/coffee_info_list.dart';
import 'package:flutter/material.dart';

const defaultMessage = '--';

// コーヒー情報リストを表示させる
class CoffeeInfoCard extends StatelessWidget {
  CoffeeInfo coffeeInfo;
  CoffeeInfoCard({
    Key? key,
    required this.coffeeInfo,
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
          coffeeInfo.beansName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text('${coffeeInfo.memo ?? defaultMessage}'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('tap');
        },
      ),
    );
  }
}
