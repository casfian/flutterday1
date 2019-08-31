import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';

//step 2:
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Step 3: define 2 Variables
  String url = 'https://ams-api.astro.com.my/ams/v3/getChannelList';
  List data;
  //end variables

  //Step 5: Create 2 Functions
  //Function to request JSON from a URL
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["channels"];
      print(data);
    });
    return null;
  }

  Future init() async {
    this.makeRequest();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title:Text('Material App Bar'),
          
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.place),
              onPressed: () {
                //code
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //code
              },
            ),
          ],
        ),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                onTap: () {
                  //Navigation code
                },
                title: Text('Home'),
              ),
              ListTile(
                title: Text('About Us'),
              ),
            ],
          )
        ),
        //Step 4 Add a ListView Builder to Body
        body: ListView.builder(
            //Step 6: Count the data
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(data[index]['channelStbNumber'].toString()),
                title: Text(data[index]['channelTitle']),
              );
            }),
      ),
    );
  }
}

/*
//2nd Attempt 
void main() {
runApp(MyApp(
  // //source data
  // items: List<String>.generate(10, (i) => "Item $i"),
));

} 
 
class MyApp extends StatelessWidget {
  //create an Array
  final List<String> items = ["Apple", "Banana", "Coconut", "Durian"];
  // MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fruit Channel'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );
          }
        ),
    ));
  }
}
*/

/*
//First Attempt
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fruit Channel'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              onTap: () {
                //code
                print('goto Screen2');
              },
              leading: Image.asset('images/apple.jpg'),
              title: Text('This is an Apple'),
              subtitle: Text('Apple is Expensive'),
              trailing: Icon(Icons.add_alert),
            ),
            ListTile(
              leading: Image.asset('images/banana.jpg'),
              title: Text('This is a Banana'),
              subtitle: Text('Banana is Yellow'),
            )
          ],
        )
      ),
    );
  }
}
*/
