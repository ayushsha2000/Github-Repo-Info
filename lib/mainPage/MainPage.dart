import 'dart:convert';
import 'dart:ui';

import 'package:destini/Information/information.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/mainPage';
  final String userName;
  MainPage({this.userName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                Text(
                  'Github',
                  style: TextStyle(color: Colors.black),
                ),
                Text('Info'),
              ],
            ),
            elevation: 0,
            // backgroundColor: Color(0xFFD6D6D6)
            backgroundColor: Color(0xFFBDBDBD)),
        body: Body(userName: userName));
  }
}

class Body extends StatefulWidget {
  final String userName;
  Body({this.userName});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // ignore: deprecated_member_use
  static List<GithubInformation> _info = List<GithubInformation>();
  // ignore: deprecated_member_use
  static List<GithubInformation> _infoInApp = List<GithubInformation>();
  Future<List<GithubInformation>> getInformation(String userName) async {
    var url = 'https://api.github.com/users/$userName/repos';
    var response = await http.get(Uri.parse(url));
    // ignore: deprecated_member_use
    var gitInformation = List<GithubInformation>();

    if (response.statusCode == 200) {
      var informationBody = jsonDecode(response.body);
      for (var information in informationBody) {
        gitInformation.add(GithubInformation.fromJson(information));
      }
    }
    return gitInformation;
  }

  @override
  void initState() {
    getInformation(widget.userName).then((value) {
      setState(() {
        _info = [];
        _info.addAll(value);
        _infoInApp = _info;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBDBDBD),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _listItem(index);
        },
        itemCount: _infoInApp.length,
      ),
    );
  }

  _listItem(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            //color: Color(0xFF212121),
            gradient: LinearGradient(colors: <Color>[
              Color(0xFF757575),
              Color(
                0xFF424242,
              ),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _infoInApp[index].name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(_infoInApp[index].description ?? 'NO DESCRIPTION',
                style: TextStyle(color: Colors.white)),
            SizedBox(
              height: 8.0,
            ),
            InkWell(
              child: Text(
                _infoInApp[index].repoUrl,
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () async {
                if (await canLaunch(_infoInApp[index].repoUrl)) {
                  await launch(_infoInApp[index].repoUrl);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
