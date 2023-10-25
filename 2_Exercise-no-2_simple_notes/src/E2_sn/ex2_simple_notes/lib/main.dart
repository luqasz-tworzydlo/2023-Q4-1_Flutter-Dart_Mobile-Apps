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
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15),
            buildContainer(),
            const SizedBox(height: 15),
            buildContainer(),
            const SizedBox(height: 15),
            buildContainer(),
          ],
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(

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
          Text("Zakupy", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.purple
          )),
          SizedBox(height: 3),
          Text("2023-10-28", style: TextStyle(
              fontSize: 12,
              color: Colors.red
          )),
          SizedBox(height: 7),
          Text("Kupić na jutro trzy pary skarpetek...", style: TextStyle(
              fontSize: 13,
              color: Colors.amber
          ))
        ],
      ),
    );
  }
}