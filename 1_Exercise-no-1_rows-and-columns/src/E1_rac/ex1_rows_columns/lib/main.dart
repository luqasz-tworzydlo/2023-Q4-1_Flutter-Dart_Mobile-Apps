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
                buildContainer("column 1", color: Colors.amber),
                SizedBox(height: 15),
                buildContainer("column 2"),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildContainer("tekst A", color: Colors.cyan),
                    SizedBox(width: 15),
                    buildContainer("tekst B", color: Colors.deepPurple),
                    SizedBox(width: 15),
                    buildContainer("tekst C"),
                  ],
                ),
                SizedBox(height: 15),
                buildContainer("column 4"),
              ],
            )
        )
    );
  }

  Container buildContainer(String name, {Color color = Colors.deepOrange}) {

    return Container(
      color: color,
      padding: EdgeInsets.all(20),
      child: Text(name),
    );
  }
}