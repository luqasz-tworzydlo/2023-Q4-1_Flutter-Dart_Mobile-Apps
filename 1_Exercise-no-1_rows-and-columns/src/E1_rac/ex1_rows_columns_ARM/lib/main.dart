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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildContainer("pierwszy tekst", color: Colors.yellowAccent),
                //SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildContainer("tekst A", color: Colors.transparent),
                    //SizedBox(width: 5),
                    buildContainer("tekst B", color: Colors.transparent),
                    //SizedBox(width: 5),
                    buildContainer("tekst C", color: Colors.transparent),
                    //SizedBox(width: 5),
                    buildContainer("tekst D", color: Colors.transparent),
                  ],
                ),
                //SizedBox(height: 5),
                buildContainer("trzeci tekst", color: Colors.yellowAccent),
              ],
            )
        )
    );
  }

  Container buildContainer(String name, {Color color = Colors.deepOrange}) {
    return Container(
      // color: color,
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Text(name),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(
                color: Colors.yellowAccent,
                width: 5)
        )
    );
  }
}