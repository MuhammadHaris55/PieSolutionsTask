import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_solution_task/designingElements/appColors.dart';
import 'package:pie_solution_task/screens/edit.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final List jsondata;
  final int index;

  DetailScreen({
    Key key,
    this.jsondata,
    this.index,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    List _notes = widget.jsondata;
    int index = widget.index;

    _sendingMails() async {
      String url = '';
      setState(() {
        url = 'mailto:' + _notes[index]['email_address'];
      });
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _launchCaller() async {
      String url = '';
      setState(() {
        url = 'tel:' + _notes[index]['phone_number'];
      });

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

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
          'User detail',
          style: TextStyle(
            color: appbarText,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit(
                    jsondata: _notes,
                    index: index,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.edit,
              color: appbarText,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            width: screen.width / 1.1,
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
            child: Column(
              children: [
                Text(
                  _notes[index]['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 22,
                    color: headingsColor,
                  ),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: _sendingMails,
                  child: Wrap(
                    children: [
                      Icon(Icons.quick_contacts_mail_outlined),
                      Text(
                        '  ' + _notes[index]['email_address'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: _launchCaller,
                  child: Wrap(
                    children: [
                      Icon(Icons.quick_contacts_dialer_outlined),
                      Text(
                        '   ' + _notes[index]['phone_number'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  _notes[index]['request_content'],
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
