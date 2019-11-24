import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final String username;
  final String password;
  Dashboard({
    this.username,
    this.password,
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: Text("Details"),),
      body: Column(
        children: <Widget>[
          Text(widget.username == null ? "Username" : widget.username),
          Text(widget.password == null ? "Password" : widget.password)
          // Text("Second Page")
        ],
      ),
    );
  }

}