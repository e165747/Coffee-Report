import 'package:flutter/material.dart';

class MainTemplate extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const MainTemplate(
      {Key? key,
      required this.title,
      required this.body,
      this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextField以外をタップした際，TextFieldのフォーカスを外す
    // https://qiita.com/tsukushibito/items/d7fde1d998a30292add7
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.brown.withOpacity(0.8),
          title: Text(title),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.brown.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: body),
        floatingActionButton:
            floatingActionButton, // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
