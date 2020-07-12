import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/screens/authorization.dart';
import 'package:money_tracker/screens/category_list.dart';

void main() => runApp(Tracker());

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  bool isAuthorizate = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: (isAuthorizate)
            ? CategoryList(onLogout)
            : Authorization(onAuthorizate),
      ),
    );
  }

  void onAuthorizate(String login, String password) {
    if (login == 'admin' && password == 'admin') {
      setState(() {
        isAuthorizate = true;
      });
    } else {
      // showCupertinoDialog(
      //   context: context,
      //   builder: (context) {
      //     return CupertinoAlertDialog(
      //       title: Text('123'),
      //     );
      //   },
      // );
    }
  }

  void onLogout() {
    setState(() {
      isAuthorizate = false;
    });
  }
}
