import 'package:flutter/material.dart';

class UiGuige extends StatefulWidget {
  const UiGuige({super.key});

  @override
  State<UiGuige> createState() => _UiGuige();
}

class _UiGuige extends State<UiGuige> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: null, child: Text("VP90 品牌库")),
          ],
        ),
      ),
    );
  }
}

