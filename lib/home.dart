import 'package:flutter/material.dart';
import 'package:hello_flutter/dashboard.dart';
import 'package:hello_flutter/fetch_api.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController users = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Hello Flutter"),),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
               key: _formKey,
              child: Column(
              children: <Widget>[
                Image.asset("assets/icon_flutter.png", 
                  width: 100, 
                  height: 100,
                ),
                Text("Hello Flutter", 
                  style: TextStyle(
                    color: Colors.blue[200],
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextFormField(
                  controller: users,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter your username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Wajib diisi";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: pass,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Wajib diisi";
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("Press me"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.push(context, 
                            MaterialPageRoute(builder : (context) => 
                            Dashboard(
                              username: users.text,
                              password: pass.text,
                            ))
                          );
                        } else {
                           return "Gagal";
                        }
                      },
                    ),
                  )
                ],),
                RaisedButton(
                  child: Text("Apis"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FetchApi() ));
                  },
                )
              ],
            ),
            )
          ),
      );
  }

}
