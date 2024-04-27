//////////////////////////////////////////////////
//
// => Imię i nazwisko: Łukasz Tworzydło
// => Numer albumu: gd29623
// => Nr. kierunku: INIS5_PR2
// => Przedmiot: Programowanie urządzeń mobilnych
//
//////////////////////////////////////////////////
//
// Łukasz Tworzydło - nr albumu: gd29623 [projekt zaliczeniowy]
//
//////////////////////////////////////////////////

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ContactListApp(),
  ));
}

class Kontakt {
  String nazwaKontaktu;
  String relacjaRodzinna;
  String numerTelefonu;
  String adresEmail;
  String notatkiKontaktu;
  String zdjecieDoKontaktu;

  Kontakt(this.nazwaKontaktu, this.relacjaRodzinna, this.numerTelefonu, this.adresEmail, this.notatkiKontaktu, this.zdjecieDoKontaktu);
}

class Wizytowka extends StatelessWidget {
  final String nazwaKontaktu;
  final String numerTelefonu;
  final String notatkiKontaktu;
  final String zdjecieDoKontaktu;

  Wizytowka({required this.nazwaKontaktu, required this.numerTelefonu, required this.notatkiKontaktu, required this.zdjecieDoKontaktu});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Image.asset(zdjecieDoKontaktu, width: 64.0, height: 71.5),
            Text(nazwaKontaktu, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(numerTelefonu),
            Text(notatkiKontaktu),
          ],
        ),
      ),
    );
  }
}

class ContactListApp extends StatefulWidget {
  @override
  _ContactListAppState createState() => _ContactListAppState();
}

class _ContactListAppState extends State<ContactListApp> {
  List<Kontakt> kontakty = [
    Kontakt("Mamusia", "Matka", "(+48) 123-456-789", "mama@mail.com", "Uwielbia wyjazdy rodzinne...", "images/1-13451521.jpg"),
    Kontakt("Tatuś", "Ojciec", "(+48) 234-567-890", "tata@mail.com", "Lubi dbać o rośliny na działce...", "images/2-158109.jpg"),
    Kontakt("Siostrzyczka", "Siostra", "(+48) 345-678-901", "siostra@mail.com", "Podróżniczka, uwielbia zwiedzać...", "images/3-349758.jpg"),
    Kontakt("Babcia", "Babcia", "(+48) 456-789-012", "babcia@mail.com", "Bardzo lubi dzierganie na drutach...", "images/4-4264360.jpg"),
    Kontakt("Ciocia", "Ciocia", "(+48) 567-890-123", "ciocia@mail.com", "Lubi próbować nowe przepisy...", "images/5-1996337.jpg"),
    Kontakt("Wujek", "Wujek", "(+48) 678-901-234", "wujek@mail.com", "Lubi próbować różne alkohole...", "images/6-1526410.jpg"),
    Kontakt("Kuzynka", "Kuzynka", "(+48) 789-012-345", "kuzynka@mail.com", "Bardzo lubi prace domowe...", "images/7-158536.jpg"),
    Kontakt("Kuzyn", "Kuzyn", "(+48) 890-123-456", "kuzyn@mail.com", "Lubi podróżować z synkiem...", "images/8-39310.jpg"),
    Kontakt("Chrześniak", "Syn Chrzestny", "(+48) 901-234-567", "chrzesniak@mail.com", "Uwielbia jeść słodycze...", "images/9-3478875.jpg"),
    Kontakt("Chrześniaczka", "Córka Chrzestna", "(+48) 012-345-678", "chrzesniaczka@mail.com", "Bardzo lubi plac zabaw...", "images/10-1444321.jpg")
  ];

  List<Kontakt> filtrowaneKontakty = [];
  String wyszukajKontakt = "";

  @override
  void initState() {
    super.initState();
    filtrowaneKontakty = kontakty;
    filtrowaneKontakty.sort((a, b) => a.nazwaKontaktu.compareTo(b.nazwaKontaktu));
  }

  void aktualizujSzukaneZapytanie(String noweZapytanie) {
    setState(() {
      wyszukajKontakt = noweZapytanie;
      if (wyszukajKontakt.isNotEmpty) {
        filtrowaneKontakty = kontakty
            .where((contact) =>
            contact.nazwaKontaktu.toLowerCase().contains(wyszukajKontakt.toLowerCase()))
            .toList();
      } else {
        filtrowaneKontakty = kontakty;
      }
      filtrowaneKontakty.sort((a, b) => a.nazwaKontaktu.compareTo(b.nazwaKontaktu));
    });
  }

  void dodajNowyKontakt(Kontakt nowyKontakt) {
    setState(() {
      kontakty.add(nowyKontakt);
      kontakty.sort((a, b) => a.nazwaKontaktu.compareTo(b.nazwaKontaktu));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Rodzinna Lista Kontaktów"),
      ),
      body: Column(
        children: [
          Wizytowka(
            nazwaKontaktu: "Lukasz Tworzydlo",
            numerTelefonu: "Numer telefonu: (+48) 000-000-000",
            notatkiKontaktu: "Moja wizytówka w iPhone 15 Pro Max.",
            zdjecieDoKontaktu: "images/0-10771935.jpg",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: aktualizujSzukaneZapytanie,
              decoration: InputDecoration(
                labelText: 'Szukaj',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtrowaneKontakty.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filtrowaneKontakty[index].nazwaKontaktu),
                  subtitle: Text(filtrowaneKontakty[index].relacjaRodzinna),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => stronaSzczegolyKontaktu(filtrowaneKontakty[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => stronaDodajKontakt(dodajNowyKontakt)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class stronaDodajKontakt extends StatefulWidget {
  final Function dodajKontaktCallback;

  stronaDodajKontakt(this.dodajKontaktCallback);

  @override
  _stronaDodajKontaktState createState() => _stronaDodajKontaktState();
}

class _stronaDodajKontaktState extends State<stronaDodajKontakt> {
  final _formKey = GlobalKey<FormState>();
  String nazwaKontaktu = '';
  String relacjaRodzinna = '';
  String numerTelefonu = '';
  String adresEmail = '';
  String notatkiKontaktu = '';
  String zdjecieDoKontaktu = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Kontakt nowyKontakt = Kontakt(nazwaKontaktu, relacjaRodzinna, numerTelefonu, adresEmail, notatkiKontaktu, zdjecieDoKontaktu);
      widget.dodajKontaktCallback(nowyKontakt);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Dodaj nowy kontakt'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nazwa Kontaktu'),
              validator: (value) => value!.isEmpty ? 'Wpisz nazwę dla kontaktu' : null,
              onSaved: (value) => nazwaKontaktu = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Relacja Rodzinna'),
              onSaved: (value) => relacjaRodzinna = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Numer Telefonu'),
              onSaved: (value) => numerTelefonu = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Adres Email'),
              onSaved: (value) => adresEmail = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Zdjęcie do Kontaktu'),
              onSaved: (value) => zdjecieDoKontaktu = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Notatki Kontaktu'),
              onSaved: (value) => notatkiKontaktu = value!,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                // primary: Colors.white,
                backgroundColor: Colors.grey,
              ),
              onPressed: _submitForm,
              child: Text('Dodaj Kontakt'),
            ),
          ],
        ),
      ),
    );
  }
}

void pokazInformacjeBleduWyswietlania(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Informacja"),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Use min size for the column
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
          children: <Widget>[
            Text("Funkcja obecnie niedostępna..."),
            Text("Spróbuj ponownie później..."),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Zamknij"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class stronaSzczegolyKontaktu extends StatelessWidget {
  final Kontakt kontakt;

  stronaSzczegolyKontaktu(this.kontakt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(kontakt.nazwaKontaktu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(kontakt.zdjecieDoKontaktu, width: 640, height: 715),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    // funkcja wiadomości nie jest skonfigurowana
                    pokazInformacjeBleduWyswietlania(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    // funkcja dzwonienia nie jest skonfigurowana
                    pokazInformacjeBleduWyswietlania(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.videocam),
                  onPressed: () {
                    // funkcja wideo rozmowy nie jest skonfigurowana
                    pokazInformacjeBleduWyswietlania(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () {
                    // funkcja emaila nie jest skonfigurowana
                    pokazInformacjeBleduWyswietlania(context);
                  },
                ),
              ],
            ),
            ListTile(
              title: Text('Numer Telefonu'),
              subtitle: Text(kontakt.numerTelefonu),
            ),
            ListTile(
              title: Text('Relacja Rodzinna'),
              subtitle: Text(kontakt.relacjaRodzinna),
            ),
            ListTile(
              title: Text('Adres Email'),
              subtitle: Text(kontakt.adresEmail),
            ),
            ListTile(
              title: Text('Notatki Kontaktu'),
              subtitle: Text(kontakt.notatkiKontaktu),
            )
          ],
        ),
      ),
    );
  }
}
