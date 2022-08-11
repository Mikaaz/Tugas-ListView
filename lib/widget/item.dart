import 'package:flutter/material.dart';

import '../object_list.dart';

class item extends StatefulWidget {
  const item({Key? key}) : super(key: key);

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white12,
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext cosntext, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text("Delete Person"),
                          content: Text(
                              "Are You Sure Want To Delete ${data[index].nama}"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    data.removeAt(index);
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No"))
                          ],
                        ));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 150,
                width: double.maxFinite,
                child: Card(
                  color: Colors.white30,
                  elevation: 5,
                  child: Stack(
                    children: [
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: CircleAvatar(
                              radius: 35,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nama: ${data[index].nama}"),
                                  Text("Absen: ${data[index].absen}"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
