import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Snackbardemo(),
      ),
    );
  }
}

class Snackbardemo extends StatelessWidget {
  final _controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller1,
              ),
              OutlineButton(
                child: Text('Snackbar'),
                onPressed: () {
                  //code
                  print(_controller1.text);
                  final snackBar = SnackBar(
                    content: Text(_controller1.text),
                    action: SnackBarAction(
                      label: '>',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );

                  // Find the Scaffold in the widget tree and use
                  // it to show a SnackBar.
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
