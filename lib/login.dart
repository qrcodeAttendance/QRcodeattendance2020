import 'package:flutter_all/dashbord1.dart';
import 'dart:ui';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:flutter_all/teachers.dart';
import 'Register.dart';
import 'package:http/http.dart' as http;
// ignore: camel_case_types


class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Attendance',
      theme: ThemeData(
        primarySwatch: Colors.teal,),
    home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/Teachers': (BuildContext context)=> new DashBord1(),
        '/Student': (BuildContext context)=> new DashBord1(),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Scholar', fontSize: 20.0);
  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';
  String username='';

  Future login4() async {
   var url="http://192.168.64.2/PF/login1.php";
    final response = await http.post(url, body: {
      "Name": user.text,
      "password": pass.text,
    });
   var datauser;
   if(response.body.isNotEmpty) {
     datauser = json.decode(response.body);
   }
    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
    }else{
      if(datauser[0]['level']=='Teachers'){
        Navigator.pushReplacementNamed(context, '/Teachers');
      }else if(datauser[0]['level']=='Student'){
        Navigator.pushReplacementNamed(context, '/Student');
      }

      setState(() {
        username= datauser[0]['username'];
      });

    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final textField  =TextField(
      controller: user,
      obscureText: false ,
      style: style,
      decoration: InputDecoration (
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText:'Name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),);

    final passwordField = TextField(
      controller: pass,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),);
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(50.0),
      color: Colors.teal[300],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(30.0, 15.0,20.0, 15.0),
        onPressed: () {
         login4();
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),);
    final RigesterButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(50.0),
      color: Colors.teal[300],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(30.0, 15.0,20.0, 15.0),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Register()),
          );
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),);

    return Scaffold(

      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(5),
                  child: Text('QR attendance ',
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.w300,
                        fontSize: 35),
                  ),
                ),
                Container (
                  child: Image.asset("assets/images/logo.Jpg",), height: 250 ,width: 200, alignment: Alignment.center,
                ),
                textField ,SizedBox (height: 25.0),
                passwordField, SizedBox(height: 35.0,),
                loginButon, SizedBox(height: 15.0,),
                RigesterButon,SizedBox(height: 15.0,),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
