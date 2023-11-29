import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ex3_quotes_app()
  ));
}

class ex3_quotes_app extends StatefulWidget {
  const ex3_quotes_app({super.key});

  @override
  State<ex3_quotes_app> createState() => _ex3_quotes_appState();
}

class _ex3_quotes_appState extends State<ex3_quotes_app> {

  List<String> cytaty = [
    "Mądrość rozjaśnia oblicze człowieka",
    "Błogosławieni, którzy uwierzyli, a nie widzieli",
    "Na początku było Słowo, a Słowo było Bogiem",
    "Szukajcie, a znajdziecie"
  ];

  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cytaty")
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 400,
            height: 300,
            color: Colors.black12,
            child: Text(cytaty[position])
            /// child: Text(cytaty[0]),
            /// child: Text("Mądrość rozjaśnia oblicze człowieka.")
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              if(position < cytaty.length - 1) {
                setState(() {
                  position++;
                });
              }
              else {
                setState(() {
                  position = 0;
                });
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8)
                ),
              child: Text("New Quote", style: TextStyle(
                color: Colors.white
              )),
            )
          )
        ],
      )
    );
  }
}
