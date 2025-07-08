import 'package:flutter/material.dart';

// import 'bloc_demo/demo1.dart';
// import 'json/json.dart';

void main() {
  runApp(MyHomePage());
}


class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: "90 seriver tools",
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  // const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   bottom: const TabBar(
      //     tabs: [
      //       Tab(icon: Icon(Icons.abc_outlined),),
      //       Tab(icon: Icon(Icons.home),),
      //       Tab(icon: Icon(Icons.nat),),
      //     ],),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
          FloatingActionButton.large(onPressed: (){}, 
          child: Text("dat11111111111111111111111a",
          maxLines: 1,
          style: TextStyle(
            fontSize: 18 
          ),
          )),

          FloatingActionButton(onPressed: (){}, 
          child: Text("data")),
        ],),
      )        
    );
  }
}