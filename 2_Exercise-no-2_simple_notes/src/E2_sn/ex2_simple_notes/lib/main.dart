import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon (Icons.account_box_sharp)),
          IconButton(onPressed: () => {}, icon: const Icon (Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 300,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.blue,
                )
            ),
            child: Column(
              children: const [
                Text("Zakupy"),
                Text("2023-10-28"),
                Text("Kupić na jutro trzy pary skarpetek...")
              ],
            ),
          ),
          Container(
          ),
          Container()
        ],
      ),
    );
  }
}