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
                buildContainer("column 1", Colors.amber),
                SizedBox(height: 15),
                buildContainer("column 2", Colors.blue),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildContainer("row 1", Colors.cyan),
                    SizedBox(width: 15),
                    buildContainer("row 2", Colors.deepPurple),
                    SizedBox(width: 15),
                    buildContainer("row 3", Colors.lime),
                  ],
                ),
                SizedBox(height: 15),
                buildContainer("column 4", Colors.green),
              ],
            )
        )
    );
  }

  Container buildContainer(String name, Color color) {
    return Container(
      color: color,
      padding: EdgeInsets.all(20),
      child: Text(name),
    );
  }
}