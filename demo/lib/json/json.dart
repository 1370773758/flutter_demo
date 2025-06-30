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


void  getInfo() async{
  final String jsonString = await rootBundle.loadString('json/demo.json');
  print("jsonString  -- >"+jsonString);
  // json 转 model
  PositionInfo positionInfo=PositionInfo.fromJson(json.decode(jsonString));

  String? msg = positionInfo.msg;
  int? code = positionInfo.code;
  if(code==200)
  {
    _getdata=positionInfo.data!;
    print(_getdata.toString());
  }
}

// ui
// Widget getItem(int index)
// {
//   Data data = _getdata[index];
//   return new Padding(padding: EdgeInsets.only(
//     top: 3.0,
//     left: 5.0,
//     right: 5.0,
//     bottom: 3.0
//   ),
//   child: new SizedBox(
//     child: Card(
//       elevation: 0.0,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           new Expanded(
//             child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 new Row(
//                   children: <Widget>[
//                     new Padding(padding: 
//                     EdgeInsets.only(
//                       top: 10.0,
//                       left: 10.0,
//                       bottom: 5.0
//                     ),
//                     child: new Text(data!.name!),
//                     ),
//                     new Expanded(child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: <Widget>[
//                         new Padding(padding: EdgeInsets.only(
//                           right: 10.0
//                         ),
//                         child: Text(
//                           data!.salary!,
//                           style: TextStyle(
//                             color: Colors.red
//                           ),
//                         ),)
//                       ],
//                     ))
//                   ],
//                 )
//               ],
//             ),
            
//             new Container(
//               child: new Text(data!.name!+data!.size!),
//             ))
//         ],
//       ),
//     ),
//   ),
//   )
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("职位", style: TextStyle(
//         color: Colors.white,
//         fontSize: 20
//       ),),
//       centerTitle: true,
//       ),
//       body: Container(
//         child: new ListView.builder(
//           itemCount: (_getdata == null)? 0 : _getdata.length,
//           itemBuilder: (BuildContext context, int position)
//           {
//             // return getItem
//           },
//           )),
//       ),
      
//     );
//   }
// }

// class CounterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<CounterBloc>();

//     return Scaffold(
//       appBar: AppBar(title: Text("BLoC Counter")),
//       body: Center(
//         child: BlocBuilder<CounterBloc, CounterState>(
//           builder: (context, state) => Text('Count: ${state.count}', style: TextStyle(fontSize: 30)),
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           FloatingActionButton(onPressed: () => bloc.add(Increment()), child: Icon(Icons.add)),
//           SizedBox(height: 10),
//           FloatingActionButton(onPressed: () => bloc.add(Decrement()), child: Icon(Icons.remove)),
//         ],
//       ),
//     );
//   }
// }
