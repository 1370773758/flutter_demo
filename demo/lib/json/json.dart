import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

List<Data>? _getdata;

class PositionInfo {
    String? msg;
    int? code;
    List<Data>? data;
    
    PositionInfo({this.data, this.code, this.msg});
    factory PositionInfo.fromJson(Map<String, dynamic> json) {
        return PositionInfo(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null, 
            code: json['code'], 
            msg: json['msg'], 
        );
    }
    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['msg'] = this.msg;
        if (this.data != null) {
            data['data'] = this.data!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Data {
    String? cname;
    int ?id;
    String? name;
    String? salary;
    String? size;
    String? title;
    String? username;
    Data({this.cname, this.id, this.name, this.salary, this.size, this.title, this.username});
    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            cname: json['cname'], 
            id: json['id'], 
            name: json['name'], 
            salary: json['salary'], 
            size: json['size'], 
            title: json['title'] ,
            username: json['username'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cname'] = this.cname;
        data['id'] = this.id;
        data['name'] = this.name;
        data['salary'] = this.salary;
        data['size'] = this.size;
        data['username'] = this.username;
        data['title']=this.title;
        return data;
    }
}

// ui
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  List  _getdata=[];
  Data ? data=null ;
  @override
  void initState() {
    super.initState();
    getInfo();
  }

  void  getInfo() async{
    WidgetsFlutterBinding.ensureInitialized();
    final String jsonString = await rootBundle.loadString('json/demo.json');
    // print("jsonString  -- >"+jsonString);
    PositionInfo positionInfo=PositionInfo.fromJson(json.decode(jsonString));
    setState(() {

      String?msg=positionInfo.msg;
      int? code =positionInfo.code;
      if(code==200){
        _getdata=positionInfo.data!;
        // print(_getdata.toString());
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
         title: Text("职位11",style: TextStyle(
            color: Colors.white,
            fontSize: 20
         ),),
         centerTitle:true,
       ),
        body: Container(
          child: new ListView.builder(
            itemCount: (_getdata==null)?0:_getdata.length,
            itemBuilder: (BuildContext context, int position){
              return getItem(position);
            },
          )
        ),
    );
  }

  Widget getItem(int index){
    data=_getdata[index];
    return  new Padding(padding: EdgeInsets.only(
        top: 3.0,
        left: 5.0,
        right: 5.0,
        bottom: 3.0
    ),
      child: new SizedBox(
        child: Card(
          elevation: 0.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new  Row(
                        children: <Widget>[
                          new Padding(padding:

                          EdgeInsets.only(
                              top: 10.0,
                              left: 10.0,
                              bottom: 5.0
                          ),
                            child: new Text(data!.name!),
                          ),
                          new Expanded(
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  new Padding(padding: EdgeInsets.only(
                                      right: 10.0
                                  ),
                                    child:  Text(
                                      data!.salary!,
                                      style: TextStyle(
                                          color: Colors.red
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                      new Container(
                        child: new Text(data!.name!+data!.size!,
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey
                          ),
                        ),
                        margin: EdgeInsets.only(
                            top: 5.0,
                            left: 10.0,
                            bottom: 5.0
                        ),
                      ),
                      new  Divider(),
                      new Row(
                        children: <Widget>[

                          new Padding(padding: EdgeInsets.only(
                            top: 5.0,
                            left: 10.0,
                            right: 5.0,
                            bottom: 15.0,
                          ),
                            child: new Text(
                              data!.username!+"|"+data!.title!,
                              style: TextStyle(
                                  color: new Color.fromARGB(255, 0, 215, 198)
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
        body: HomePage(),
      )
    );
  }
}
