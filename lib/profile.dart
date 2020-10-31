import 'package:flutter/material.dart';
import 'package:flutter_all/InfoCard.dart';
import 'package:flutter_all/dashbord1.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

const url = 'http://thinkdiff.net';
const email = 'mahmud@example.com';
const phone = '+880 123 456 78';
const password = '********';


class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Home  extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home > {
  _HomeState();

  void _showDialog(BuildContext context, {String title, String msg}) {
    final dialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        RaisedButton(
          color: Colors.teal,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Close',
            style: TextStyle(
              color: Colors.white,

            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (x) => dialog);
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/top_header1.png')),
            ),
          ),
          SafeArea(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/female-profile.png'),
                ),


                Text(
                  'Sara Hassan Mdkhli',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),

                InfoCard(
                  text: 'id : 437001164',
                  icon: Icons.web,
                ),
                InfoCard(
                  text: email,
                  icon: Icons.email,
                  onPressed: () async {
                    final emailAddress = 'mailto:$email';

                    if (await launcher.canLaunch(emailAddress)) {
                      await launcher.launch(emailAddress);
                    } else {
                      _showDialog(
                        context,
                        title: 'Sorry',
                        msg: 'Email can not be send. Please try again!',
                      );
                    }
                  },
                ),

                InfoCard(
                  text: phone,
                  icon: Icons.phone,),

                InfoCard(

                  text: 'Student',
                  icon: Icons.web,

                ),
                InfoCard(
                    text: password,
                    icon: Icons.card_membership,
                    onPressed: () async {
                      String removeSpaceFromPhoneNumber = phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                      final password ='password';}

                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>DashBord1()),);
                      },
                      child: Text("CANCEL",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.1,
                              color: Colors.black)),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.teal[200],
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.1,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),

              ],
            ), ),

        ],
      ),
    );
  }
}