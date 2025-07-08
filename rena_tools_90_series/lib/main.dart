import 'package:flutter/material.dart';
// import 'ui/guide.dart';
import 'dart:convert';
import 'models/user.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {


  @override
  void initState() {
    super.initState();
    getJson('json/brand_infusion.json');
  }

  void getJson(String jsonSrc) async{
    WidgetsFlutterBinding.ensureInitialized();
    final String jsonString = await rootBundle.loadString(jsonSrc);

    var JsonInfo = json.decode(jsonString);
  
    setState(() {
      switch (JsonInfo['name'])
      {
        case "brand settings":
        {
          if (JsonInfo['category'] == 'infusion')
          {
            InfusionBrand ?infusionBrand = InfusionBrand.fromJson(JsonInfo);
            print("categort = ${infusionBrand.category}");
            print("name = ${JsonInfo['name']}");
          }
          break;
        }
        case 201:
        {
          InfusionBrand ?infusionBrand = InfusionBrand.fromJson(JsonInfo);
          print("name = ${infusionBrand.name}");
          break;
        }
        default: 
        {
          print("error");
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Row(
        children: [
          Expanded(
            flex: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text("VP90 输液泵 品牌库工具",
                style: TextStyle(
                  color: Colors.white,
                ),),
                centerTitle: true,
                backgroundColor: Colors.grey,
              ),
              body: Column(
                children: [
                  Expanded(child: ListView.builder(
                    itemCount: 5,
                    itemExtent: 50.0,
                    itemBuilder: (context, index) {
                      return _listItemView(context, index);
                    },
                  ),
                  ),
                  _listAddBtn(),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey,
              child: Column(
                children: [
                  Image.network(
                    "https://ts1.tc.mm.bing.net/th/id/OIP-C.CYvrCHD2tzv8ny89VJhY3wHaE8?w=279&h=211&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
                    ),

                  ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(100000, 50),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text("导入配置")
                  ),
                  SizedBox(height: 10),

                  ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(100000, 50),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text("导出配置")
                  ),
                  SizedBox(height: 10),

                  ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(100000, 50),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text("清除配置")
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItemView(context, index)
  {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _indexTitle(context, index),
        // Text('${index + 1}',style: TextStyle(color: Colors.pink),),
        // SizedBox(width: 10),
        // Text("id: brand_boon"),
        // SizedBox(width: 10),
        // Text("type: 普通"),
        // SizedBox(width: 10),

        // Text("name: 保安 ${index * 500}"),
        
        // IconButton(onPressed: (){
        //   onDelete(context, index);
        // },
        // icon: Icon(Icons.delete),
        // ),
      ],
    );
  }

  void onDelete(context, index)
  {

  }

  Widget _indexTitle(context, index)
  {
    return ElevatedButton(onPressed: (){},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(1000, 50),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        ),
     ),

      child: null,
     );
    // return Row(
      // children: [
        // Text("${index + 1}"),
        // SizedBox(width: 100),
        // Text("data"),
      // ],
    // );
  }

  Widget _listAddBtn()
  {
    return Positioned(child: 
      FloatingActionButton(onPressed: (){},
      child: Icon(Icons.add),
      ),
    );
  }
}
