import 'dart:ui';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_all/dashbord1.dart';
import 'package:http/http.dart' as http;
import 'login.dart';
import 'package:toast/toast.dart';



class Register extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Attendance',
      theme: ThemeData(
        primarySwatch: Colors.teal,),
      home: MyHomePage(),


    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Scholar', fontSize: 20.0);

  TextEditingController ID = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();
  TextEditingController Level = TextEditingController();
  TextEditingController Password = TextEditingController();


  Future register() async {
   var url = " http://192.168.64.2/PF/Register1.php";//IMORTE
   var input= {
     "ID ": ID.text,
     "Name": Name.text,
     "Email": Email.text,
     "phoneNumber": PhoneNumber.text,
     "Level": Level.text,
     "Password": Password.text,

   };
   var body = json.encode(input);
   var response = await http.post(url, body: input);

  if(jsonDecode(response.body.toString()) == "Account already exists!"){
  Toast.show(
   "Username Exists. Please try again!",
  context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM    );

  }else{
  if(jsonDecode(response.body.toString()) == "Success"){
  Toast.show(
  "Register Successful!",
  context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM    );
  Navigator.push(context, MaterialPageRoute(builder: (context) =>DashBord1()),);

  }else {
    Toast.show(
 "Error, Please try again!",
        context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM    );

  }
  }
}

@override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names


    final IdNumerField  =TextField(
      controller: ID,
      obscureText: false ,
      style: style,
      decoration: InputDecoration (
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText:'ID Number',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),);

    final NameField  =TextField(
     controller: Name,
      obscureText: false ,
      style: style,
      decoration: InputDecoration (
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText:'Name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),);

    final EmailField  =TextField(
      controller: Email,
      obscureText: false ,
      style: style,
      decoration: InputDecoration (
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText:'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),);

    final phoneNumerField  =TextField(
      controller: PhoneNumber,
      obscureText: false ,
      style: style,
      decoration: InputDecoration (
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText:'Phone Number',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),);
    final LevelField  =TextField(
      controller: Level,
      obscureText: false ,
      style: style,
      decoration: InputDecoration (
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText:'Are you Student or Teacher',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),);


    final passwordField = TextField(
     controller: Password,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),);


    final RegisterButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(50.0),
      color: Colors.teal[200],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(30.0, 15.0,20.0, 15.0),
        onPressed: () {
          register();
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),);
    final cancelButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(50.0),
      color: Colors.teal[200],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(30.0, 15.0,20.0, 15.0),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Login()),);
        },
        child: Text("CANCEL",
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
                IdNumerField ,SizedBox (height: 10.0),
                NameField,SizedBox (height: 10.0),
                EmailField,SizedBox (height: 10.0),
                phoneNumerField,SizedBox (height: 10.0),
                LevelField,SizedBox (height: 10.0),
                passwordField, SizedBox(height: 10.0,),
                RegisterButon,SizedBox(height: 10.0,),
                cancelButon,SizedBox(height: 10.0,),

              ],
            ),
          ),
        ),
      ),
    );
  }




}
