import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 2,
          // Generate 20 Widgets that display their index in the List
          children: List.generate(20, (index) {
            return Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: new EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: new BorderRadius.circular(10.0)),
                child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
              )
            );
          }),
        ),
      ),
    );
  }
}
