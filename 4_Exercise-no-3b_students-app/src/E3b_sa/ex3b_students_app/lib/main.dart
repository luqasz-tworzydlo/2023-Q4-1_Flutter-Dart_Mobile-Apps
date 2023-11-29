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

class Student {
  String ImieNazwisko;
  int Wiek;
  String imageSciezkaZdjecia;

  Student(this.ImieNazwisko, this.Wiek, this.imageSciezkaZdjecia);
}

class _ex3_quotes_appState extends State<ex3_quotes_app> {

  List<Student> students_ImieNazwiskoWiek = [
    Student("Jan Nowak", 20, "images/1251861.jpg"),
    Student("Ania Czekaj", 22, "images/1326946.jpg"),
    Student("Jarosław Kruk", 23, "images/1438081.jpg"),
    Student("Martyna Kowalska", 21, "images/1462630.jpg"),
    Student("Władimir Łukaszenko", 24, "images/247899.jpg"),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('=> Imię i nazwisko: ${students_ImieNazwiskoWiek[position].ImieNazwisko}'),
                  Text('=> Wiek studenta: ${students_ImieNazwiskoWiek[position].Wiek}'),
                  Image.asset(students_ImieNazwiskoWiek[position].imageSciezkaZdjecia,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    if (position > 0) {
                      setState(() {
                        position = position - 1;
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("Previous / Poprzedni", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    if (position < students_ImieNazwiskoWiek.length - 1) {
                      setState(() {
                        position = position + 1;
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("Next / Następny", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}
