import "package:flutter/material.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hello_flutter/api_model.dart';

class FetchApi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FetchApiState();
  }
}

class FetchApiState extends State<FetchApi> {
  var loading = true;
  List apisarray = List<ApiModel>();

  void getapi() async {
    setState(() {
      loading = true;
    });

    var jsons = await http.get("https://jsonplaceholder.typicode.com/posts");

    var jsonData = json.decode(jsons.body);

    jsonData.forEach((x) {
      var temp = ApiModel.fromJson(x);
      apisarray.add(temp);
    });
    setState(() {
      loading = false;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getapi();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Apis"),
      ),
      body: ListView.builder(
      itemCount: apisarray.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(apisarray[index].title),
          subtitle: Text(apisarray[index].body),
        );
        },
      ),
    );
  }

}