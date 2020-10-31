import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Teachers extends StatelessWidget {
  Teachers({this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    var infoTextStyle =TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontFamily: "Montserrat Regular");

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/top_header2.png')),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 90,
                    margin: EdgeInsets.only(bottom: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child:
                          Image.asset('assets/images/female-profile.png'),),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Name : Dalia Elkamchcouchi',
                              style: TextStyle(
                                  fontFamily: "Montserrat Medium",
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                            Text(
                              'Email : dhelkamchcouchi@pnu.edu.sa',
                                style: infoTextStyle
                            ),
                            Text(
                              'ID : 43700****',
                                style: infoTextStyle
                            ),
                            Text(
                              'Collage: Computer and Information Sciences',
                              style: infoTextStyle
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          shape:CircleBorder (
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Material(
                                child: MaterialButton(
                                  onPressed: (){},

                                  child: Image.asset(
                                    'assets/images/personal_information.png',
                                    height: 90,
                                  ),),),
                              Text(
                                
                                'Personal info.',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape: CircleBorder(),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Material(
                                child: MaterialButton(

                                  onPressed: (){},
                                  child: Image.asset(
                                    'assets/images/qrcode.reader.png',
                                    height: 90,
                                  ),),),
                              Text(
                                'QR code Scanner',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape: CircleBorder(),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Material(
                                child: MaterialButton(

                                  child: Image.asset(
                                    'assets/images/att.png',
                                    height: 90,
                                  ),),),
                              Text(
                                'Attendance',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape: CircleBorder(),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Material(
                                child: MaterialButton(

                                  child: Image.asset('assets/images/attendance.png',
                                    height: 85,
                                  ),),),
                              Text(
                                'weekly Schedule',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape: CircleBorder(),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Material(
                                child: MaterialButton(

                                  child: Image.asset(
                                    'assets/images/weekly_schedual.png',
                                    height: 85,
                                  ),),),
                              Text(
                                'Academic Calender',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: CircleBorder(),
                          elevation: 4,
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Material(
                                child: MaterialButton(
                                  onPressed: (){},
                                  child: Image.asset(
                                    'assets/images/support.png',
                                    height: 85,
                                  ),),),
                              Text(
                                'technical Support',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
