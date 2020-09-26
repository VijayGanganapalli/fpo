import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpo/util/constants.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height
                : MediaQuery.of(context).size.height / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Welcome User,\nLogin to your account",
                    textAlign: TextAlign.center,
                    style: Constants.boldHeading,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
