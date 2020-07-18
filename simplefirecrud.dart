//main.dart
//dependency 
//add cloud_firebase in pubspec.yaml

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Adddatatofirestore(),
    );
  }
}

class Adddatatofirestore extends StatefulWidget {
  @override
  _AdddatatofirestoreState createState() => _AdddatatofirestoreState();
}

class _AdddatatofirestoreState extends State<Adddatatofirestore> {

final db = Firestore.instance;
final _controller = TextEditingController();
final _controller2 = TextEditingController();

@override
Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
              Text('Nama Student:'),
              TextField(controller: _controller,),
              Text('Student ID:'),
              TextField(controller: _controller2,),
              RaisedButton(
                child:Text('Submit'),
                onPressed: ()  async {
                  await db.collection('info').add(
                  {
                    'studentname': _controller.text,
                    'studentic': _controller2.text,
                  },
                );

                },
              ),
              StreamBuilder<QuerySnapshot>(
              stream: db.collection('info').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.documents.map((doc) {
                      return ListTile(
                        title: Text(doc.data['studentname']),
                        subtitle: Text(doc.data['studentic']),
                        );
                    }).toList(),
                  );
                } else {
                  return SizedBox();
                }
              }),
              ],
            ),
          ],
        ),
      );
}
}
