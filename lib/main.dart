import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map data;
  List _notes;

  fetchAlbum() async {
    var url = 'https://pietest.dev.new.wf/data.json';
    try {
      var response = await http
          .get(Uri.parse(url), headers: {"content-type": "application/json"});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        setState(() {
          data = json.decode(response.body);
          _notes = data['categories'];
        });

        print('after decode');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetching Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('PieSolutionsTask'),
          ),
          body: _notes == null
              ? Center(child: Text("Data is loading"))
              : ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, int index) {
                    return Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        margin: EdgeInsets.only(top: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Text(
                          _notes[index]['name'],
                        ),
                      ),
                    );
                  })),
    );
  }
} // class MyHomePage extends StatefulWidget {
