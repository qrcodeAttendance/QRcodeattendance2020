library weekly_timetable;
export 'src/timetable.dart';
export 'src/weekly_times.dart';
import 'package:flutter/material.dart';
import 'package:weekly_timetable/weekly_timetable.dart';


class weekly_times extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter TimeTable Plugin Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WeeklyTimeTable(
//        cellColor: Color.fromRGBO(0, 184, 255, 1.0),
//        cellSelectedColor: Color.fromRGBO(189, 0, 255, 1.0),
//        boarderColor: Color.fromRGBO(0,30,255, 1.0),
        locale: 'sa',
        onValueChanged: (Map<int, List<int>>selected) {
          print(selected);
        },
      ),
    );
  }
}
