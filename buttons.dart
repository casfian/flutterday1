import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buttons Demo'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  child: Text('Raised Button'),
                  onPressed: () {
                    print('This is Raised Button');
                  },
                ),
                FlatButton(
                  child: Text('Flat Button'),
                  onPressed: () {
                    print('This is Flat Button');
                  },
                ),
                OutlineButton(
                  child: Text('Outline Button'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    print('This is Outline Button');
                  },
                ),
                FloatingActionButton(
                  child: Icon(Icons.place),
                  tooltip: 'Floating Button',
                  onPressed: () {
                    print('This is Floating Button');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
