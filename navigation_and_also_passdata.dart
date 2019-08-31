//file main.dart
//using Routes with navigation

import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Screen1(),
    //guna Routing
    routes: <String, WidgetBuilder> {
    'screen1': (BuildContext context) => Screen1(),
    'screen2': (BuildContext context) => Screen2(),
    'screen3': (BuildContext context) => Screen3(),
    //----end define route
  },

  ));
}


//file screen1.dart

import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => new _Screen1State();
}

class _Screen1State extends State<Screen1> {
  
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: new ListView( 
        children: <Widget>[
          new ListTile(title: new TextField(controller: _textController,),),
          new ListTile(title: new RaisedButton(
            child: new Text("Next"),
            onPressed: () {
              //do something when pressed

              // original kaedah just navigate
              // var navigator = Navigator;
              // navigator.of(context).push(route);

              // // Kaedah 1
              // var route = new MaterialPageRoute(builder: (BuildContext context) => 
              //  new Screen2(value: _textController.text),);
              
              //Kaedah 2
              Navigator.push(context, MaterialPageRoute(builder:(context) 
                => new Screen2(value: _textController.text)));
            }
          ),)
        ],
      )
      /*body: Center(
        child: RaisedButton(
          child: Text('Goto screen 2'),
          onPressed: () {
            //ke screen 2
            Navigator.of(context).pushNamed('screen2');
            //----
          },
        ),
      ), */
    );
  }
}

// end of file screen1.dart




//file screen2.dart

import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {

  //Create an Object to receive the Passed Data from _TextFieldController
  final String value;
  //This is how it goes to Secondscreen using key value
  Screen2({Key key, this.value}) : super (key: key);

  @override
  _Screen2State createState() => new _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
      ),
      body: Center(
        //Display The Object received
        child: new Text('${widget.value}'),
        /*child: RaisedButton(
          child: Text('Goto Screen 3'),
          onPressed: () {
            //ke screen 3
            Navigator.of(context).pushNamed('screen3');
            //----
          },
        ), */
      ),
    );
  }
}

//end of file screen2.dart




//file Screen3.dart

import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 3"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go back Screen 1'),
          onPressed: () {
            //go back on level
            //Navigator.pop(context);

            //Guna ne utk balik ke screen 1
            Navigator.of(context).pushNamedAndRemoveUntil('screen1', 
            (Route<dynamic> route) => false);
            //----
          },
        ),
      ),
    );
  }
}

//end of file Screen3.dart

