//Make sure you added in pubspec.yaml
//  shared_preferences:

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

final _textController1 = TextEditingController();
final _textController2 = TextEditingController();
final _nameController = TextEditingController();
final _phoneController = TextEditingController();

_saveValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", _textController1.text);
    prefs.setString("phone", _textController2.text);
  }

  getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nameController.text = prefs.getString("name");
    _phoneController.text = prefs.getString("phone");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shared Preference demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Shared Preference demo'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: Column(
              children: <Widget>[
                Text('To Save', style: TextStyle(fontSize: 20),),
                Text('Name'),
                TextField(controller: _textController1,),
                Text('Phone'),
                TextField(controller: _textController2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Save Value'),
                      onPressed: () {
                          _saveValues();
                      },
                    ),
                    SizedBox(width: 10,),
                    RaisedButton(
                      child: Text('Show Value'),
                      onPressed: () {
                          getSharedPreferences();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 100,),
                Text('To Show', style: TextStyle(fontSize: 20),),
                Text('Name:'),
                TextField(controller: _nameController,),
                Text('Phone'),
                TextField(controller: _phoneController,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
