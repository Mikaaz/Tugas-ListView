// import package
import 'package:flutter/material.dart';
import 'package:listview/object_list.dart';
import 'package:listview/widget/item.dart';

class ListPage extends StatefulWidget {
  static const routeName = "second_page";

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.person_outline)),
    Tab(icon: Icon(Icons.auto_mode)),
    Tab(icon: Icon(Icons.call)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);
    _controller!.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
      print("Selected Index: " + _controller!.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: list, controller: _controller, onTap: (index){},),
      ),
      body: TabBarView(
      controller: _controller,
      children: [
        item(),
        Center(child: Text( _selectedIndex.toString()),),
        Center(child: Text( _selectedIndex.toString()),),
      ],
      ),
    );
  }
}
