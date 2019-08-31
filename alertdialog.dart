import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter AlertDialog',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter AlertDialog"),
          backgroundColor: Colors.green,
        ),
        body: Home(),
      ),
    );
  }
}

//Home for Android
// class Home extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: RaisedButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               // return object of type AlertDialog
//               return AlertDialog(
//                 title: new Text("AlertDialog"),
//                 content: new Text("Creates an alert dialog."),
//                 actions: <Widget>[
//                   // usually buttons at the bottom of the dialog
//                   new FlatButton(
//                     child: new Text("Close"),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: Text('Show AlertDialog'),
//       ),
//     );
//   }
// }

//Home for iOS
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
      onPressed: () {
        showDialog(
          context: context,
          // return object of type AlertDialog
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Column(
              children: <Widget>[
                Text("CupertinoAlertDialog"),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
            content: Text("An iOS-style alert dialog."),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          ),
        );
      },
      child: Text('Show Cupertino AlertDialog'),
    ));
  }
}
