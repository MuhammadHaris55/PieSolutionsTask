import 'package:flutter/material.dart';
import 'package:pie_solution_task/designingElements/appColors.dart';
import 'package:pie_solution_task/screens/detailScreen.dart';

class Home extends StatefulWidget {
  final List jsondata;

  Home({
    Key key,
    this.jsondata,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List _notes = widget.jsondata;

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: appbarColor,
        automaticallyImplyLeading: false,
        title: Text(
          'PieSolutionsTask',
          style: TextStyle(
            color: appbarText,
          ),
        ),
        centerTitle: true,
      ),
      body: _notes == null
          ? Center(child: Text("Data is loading"))
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, int index) {
                return Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    margin: EdgeInsets.only(top: 10.0),
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
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  jsondata: _notes,
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Text(
                              _notes[index]['name'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _notes.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
