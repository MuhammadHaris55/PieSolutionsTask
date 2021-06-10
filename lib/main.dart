import 'package:flutter/material.dart';
import 'package:pie_solution_task/screens/dataRetrievalScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetching Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataRetriever(),
    );
  }
}
