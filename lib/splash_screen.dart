import 'dart:async';
import 'package:flutter/material.dart';
import 'package:listview/list_view.dart';

// membuat class splash screen untuk dipanggil di main dart
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // mengset timer
    Timer(Duration(seconds: 3), () {
      // menggunakan pushreplacement
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ListPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            child: Image(
                image: NetworkImage(
                    "https://ae01.alicdn.com/kf/HTB1dNXMSpXXXXX2XFXXq6xXFXXXs.jpg?size=107348&height=800&width=800&hash=ee951cd334c79ffefbf30430512ec964")),
          ),
        ),
      ),
    );
  }
}
