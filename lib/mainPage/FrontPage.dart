import 'package:destini/mainPage/MainPage.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  final _username = TextEditingController();
  String userName;

  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF757575),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              //color: Colors.black,
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
                    blurRadius: 8.0,
                    spreadRadius: 5.0,
                    offset: Offset(2.0, 2.0))
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://img.favpng.com/23/24/22/computer-icons-github-icon-design-logo-png-favpng-k5T4PbVkQcj95MdEmqdw9hhk7.jpg'),
                  fit: BoxFit.fitHeight),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0xFFBDBDBD)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Github UserName',
                  focusColor: Colors.black,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    // borderRadius: BorderRadius.circular(20),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                controller: _username,
                onChanged: (value) {
                  userName = value;
                  // sendUserName(value);
                },
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            onPressed: () {
              _username.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(
                    userName: userName,
                  ),
                ),
              );
            },
            child: Text('Show Repo'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Make Sure your Internet is Stable!',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                wordSpacing: 2.0,
                letterSpacing: 2.0),
          )
        ],
      ),
    );
  }
}
