import 'package:ex2_simple_notes/Note.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ));
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<Note> data = [
    Note(
        title: "Zakupy",
        date: "2023-10-18",
        text: "Kupić na jutro trzy pary skarpetek..."
    ),
    Note(
        title: "Lekcje",
        date: "2023-11-13",
        text: "Przygotować projekt (z programowania) w C#..."
    ),
    Note(
        title: "Sprzątania",
        date: "2023-10-19",
        text: "Posprzątać mieszkanie, odkrzyć, wytrzeć kurz, umyć podłogę oraz okna"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => {}, icon: const Icon (Icons.account_box_sharp)),
          IconButton(onPressed: () => {}, icon: const Icon (Icons.add)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15),
            buildContainer(data[0].title, data[0].date, data[0].text),
            const SizedBox(height: 15),
            buildContainer(data[1].title, data[1].date, data[1].text),
            const SizedBox(height: 15),
            buildContainer(data[2].title, data[2].date, data[2].text),
          ],
        ),
      ),
    );
  }

  Container buildContainer(String title, String date, String text) {
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
        children: [
          Text(title, style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.purple
          )),
          SizedBox(height: 3),
          Text(date, style: const TextStyle(
              fontSize: 12,
              color: Colors.red
          )),
          SizedBox(height: 7),
          Text(text, style: const TextStyle(
              fontSize: 13,
              color: Colors.amber
          ))
        ],
      ),
    );
  }
}