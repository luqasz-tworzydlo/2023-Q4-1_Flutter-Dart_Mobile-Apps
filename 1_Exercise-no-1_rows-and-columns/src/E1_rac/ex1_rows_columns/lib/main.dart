import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("my app"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.deepOrange,
                  padding: EdgeInsets.all(20),
                  child: Text("container no 1"),
                ),
                SizedBox(height: 15),
                Container(
                  color: Colors.deepPurple,
                  padding: EdgeInsets.all(20),
                  child: Text("container no 2"),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.yellow,
                      padding: EdgeInsets.all(20),
                      child: Text("wiersz 1"),
                    ),
                    SizedBox(width: 15),
                    Container(
                      color: Colors.blue,
                      padding: EdgeInsets.all(20),
                      child: Text("wiersz 2"),
                    ),
                    SizedBox(width: 15),
                    Container(
                      color: Colors.pink,
                      padding: EdgeInsets.all(20),
                      child: Text("wiersz 3"),
                    ),
                  ],

                ),
                SizedBox(height: 15),
                Container(
                  color: Colors.lightGreen,
                  padding: EdgeInsets.all(20),
                  child: Text("container no 4"),
                )
              ],
            )
        )
    );
  }
}

