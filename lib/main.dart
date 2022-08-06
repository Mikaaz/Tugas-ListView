import 'package:flutter/material.dart';
import 'package:listview/list_view.dart';

void main() {
  runApp(const MainPAge());
}

class MainPAge extends StatelessWidget {
  const MainPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListPage(),
    );
  }
}