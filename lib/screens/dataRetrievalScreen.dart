import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_solution_task/designingElements/appColors.dart';
import 'package:pie_solution_task/designingElements/buttonDesigning.dart';
import 'package:pie_solution_task/screens/home.dart';

class DataRetriever extends StatefulWidget {
  DataRetriever({Key key}) : super(key: key);

  @override
  _DataRetrieverState createState() => _DataRetrieverState();
}

class _DataRetrieverState extends State<DataRetriever> {
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

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: appbarColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome',
          style: TextStyle(
            color: appbarText,
          ),
        ),
        centerTitle: true,
      ),
      body: _notes == null
          ? Center(child: Text("Data is loading"))
          : Center(
              child: ElevatedButton(
                style: buttonDesign,
                child: button_design(screen, "Get Started"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                        jsondata: _notes,
                      ),
                    ),
                  );
                },
              ),
              // ElevatedButton(
              //   child: Text(
              //     'press',
              //   ),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Home(
              //           jsondata: _notes,
              //           // detail: _notes[index],
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ),
    );
  }
}
