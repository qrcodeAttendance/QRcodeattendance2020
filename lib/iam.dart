import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'login.dart';
import 'Teacher_login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue), home: HomeScreen());
  }
}
class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final  TecherButton = Material(
      elevation: 2.0,
      shape: CircleBorder(),
      child: MaterialButton(
        child: Image.asset('assets/images/teacher.png',
          height: 180.0,
          width: 160.0,),
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Login()),);},

      ),);
    final  StudentButton = Material(
      elevation: 2.0,
      shape: CircleBorder(),

        child: MaterialButton(
        child: Image.asset('assets/images/student.png',
          height: 180.0,
          width: 160.0,),
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Login()),);},
         
      ),
       
          
    );
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Center(

         child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            TecherButton,SizedBox(height: 10.0,),
            StudentButton,SizedBox(height: 10.0,), ],


            )

        ),
    );

  }
}