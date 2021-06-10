import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_solution_task/designingElements/appColors.dart';
import 'package:pie_solution_task/designingElements/buttonDesigning.dart';
import 'package:pie_solution_task/screens/home.dart';

class Edit extends StatefulWidget {
  final List jsondata;
  final int index;

  Edit({
    this.jsondata,
    this.index,
  });

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List _notes = widget.jsondata;
    int index = widget.index;

    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: appbarColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: appbarText,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Edit detail',
          style: TextStyle(
            color: appbarText,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: listContainerColor,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.black),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 5.0,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: _notes[index]['name'],
                decoration: new InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onChanged: (val) => _notes[index]['name'] = val,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                initialValue: _notes[index]['email_address'],
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onChanged: (val) => _notes[index]['email_address'] = val,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                initialValue: _notes[index]['phone_number'],
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onChanged: (val) => _notes[index]['phone_number'] = val,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                initialValue: _notes[index]['request_content'],
                decoration: new InputDecoration(
                  labelText: 'Content',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onChanged: (val) => _notes[index]['request_content'] = val,
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: buttonDesign,
                child: button_design(screen, "Update"),
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
            ],
          ),
        ),
      ),
    );
  }
}
