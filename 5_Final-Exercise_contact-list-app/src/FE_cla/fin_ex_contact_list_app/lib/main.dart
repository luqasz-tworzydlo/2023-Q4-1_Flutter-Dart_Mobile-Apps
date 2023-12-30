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

class ContactListApp extends StatefulWidget {
  @override
  _ContactListAppState createState() => _ContactListAppState();
}

class _ContactListAppState extends State<ContactListApp> {
  List<Kontakt> kontakty = [
    Kontakt("Mamusia", "Matka", "123-456-789", "mama@mail.com", "Uwielbia wyjazdy rodzinne...", "images/1-13451521.jpg"),
    Kontakt("Tatuś", "Ojciec", "234-567-890", "tata@mail.com", "Lubi dbać o rośliny na działce...", "images/2-158109.jpg"),
    Kontakt("Siostrzyczka", "Siostra", "345-678-901", "siostra@mail.com", "Podróżniczka, uwielbia zwiedzać...", "images/3-349758.jpg"),
    Kontakt("Babcia", "Babcia", "456-789-012", "babcia@mail.com", "Bardzo lubi dzierganie na drutach...", "images/4-4264360.jpg"),
    Kontakt("Ciocia", "Ciocia", "567-890-123", "ciocia@mail.com", "Lubi próbować nowe przepisy...", "images/5-1996337.jpg"),
    Kontakt("Wujek", "Wujek", "678-901-234", "wujek@mail.com", "Lubi próbować różne alkohole...", "images/6-1526410.jpg"),
    Kontakt("Kuzynka", "Kuzynka", "789-012-345", "kuzynka@mail.com", "Bardzo lubi prace domowe...", "images/7-158536.jpg"),
    Kontakt("Kuzyn", "Kuzyn", "890-123-456", "kuzyn@mail.com", "Lubi podróżować z synkiem...", "images/8-39310.jpg"),
    Kontakt("Chrześniak", "Syn Chrzestny", "901-234-567", "chrzesniak@mail.com", "Uwielbia jeść słodycze...", "images/9-3478875.jpg"),
    Kontakt("Chrześniaczka", "Córka Chrzestna", "012-345-678", "chrzesniaczka@mail.com", "Bardzo lubi plac zabaw...", "images/10-1444321.jpg")
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
        title: Text("Rodzinna Lista Kontaktów"),
      ),
      body: Column(
        children: [
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
              onPressed: _submitForm,
              child: Text('Dodaj Kontakt'),
            ),
          ],
        ),
      ),
    );
  }
}

class stronaSzczegolyKontaktu extends StatelessWidget {
  final Kontakt kontakt;

  stronaSzczegolyKontaktu(this.kontakt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  },
                ),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    // funkcja dzwonienia nie jest skonfigurowana
                  },
                ),
                IconButton(
                  icon: Icon(Icons.videocam),
                  onPressed: () {
                    // funkcja wideo rozmowy nie jest skonfigurowana
                  },
                ),
                IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () {
                    // funkcja emaila nie jest skonfigurowana
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
              title: Text('Notatki Kontaktu'),
              subtitle: Text(kontakt.notatkiKontaktu),
            )
          ],
        ),
      ),
    );
  }
}
