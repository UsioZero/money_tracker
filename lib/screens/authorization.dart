import 'package:flutter/material.dart';

class Authorization extends StatefulWidget {
  final Function(String, String) onAuthorizate;

  Authorization(this.onAuthorizate);

  @override
  _AuthorizationState createState() => _AuthorizationState(onAuthorizate);
}

class _AuthorizationState extends State<Authorization> {
  Function(String, String) onAuthorizate;
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _AuthorizationState(this.onAuthorizate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 450),
        child: Column(
          children: <Widget>[box(), setLogin(), setPassword(), loginButton()],
        ),
      ),
    );
  }

  Flexible box() {
    return Flexible(
      flex: 1,
      child: Container(
        child: Center(
          child: Text(''),
        ),
        decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150))),
      ),
    );
  }

  Padding setLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _loginController,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
              prefixIcon: Icon(Icons.lock),
              hintText: 'login',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1)),
            ),
          ),
        ],
      ),
    );
  }

  Padding setPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _passwordController,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
              prefixIcon: Icon(Icons.vpn_key),
              hintText: 'password',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1)),
            ),
          ),
        ],
      ),
    );
  }

  Padding loginButton() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            color: Colors.green[200],
            onPressed: () {
              onAuthorizate(_loginController.text, _passwordController.text);
            },
            child: Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ));
  }
}
