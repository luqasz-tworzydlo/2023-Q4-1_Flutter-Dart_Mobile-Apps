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
  String zdjecieDoKontaktu;

  Kontakt(this.nazwaKontaktu, this.relacjaRodzinna, this.numerTelefonu, this.zdjecieDoKontaktu);
}

class ContactListApp extends StatefulWidget {
  @override
  _ContactListAppState createState() => _ContactListAppState();
}

class _ContactListAppState extends State<ContactListApp> {
  List<Kontakt> kontakty = [
    Kontakt("Mamusia", "Matka", "123-456-789", "images/mom.png"),
    Kontakt("Tatuś", "Ojciec", "234-567-890", "images/dad.png"),
    Kontakt("Siostrzyczka", "Siostra", "345-678-901", "images/sister.png")
  ];

  List<Kontakt> filtrowanieKontaktow = [];
  String wyszukajKontakt = "";

  @override
  void initState() {
    super.initState();
    filtrowanieKontaktow = kontakty;
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      wyszukajKontakt = newQuery;
      if (wyszukajKontakt.isNotEmpty) {
        filtrowanieKontaktow = kontakty
            .where((contact) =>
            contact.nazwaKontaktu.toLowerCase().contains(wyszukajKontakt.toLowerCase()))
            .toList();
      } else {
        filtrowanieKontaktow = kontakty;
      }
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
              onChanged: updateSearchQuery,
              decoration: InputDecoration(
                labelText: 'Szukaj',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtrowanieKontaktow.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filtrowanieKontaktow[index].nazwaKontaktu),
                  subtitle: Text(filtrowanieKontaktow[index].relacjaRodzinna),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactDetailsPage(filtrowanieKontaktow[index]),
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
          // Navigate to add new contact screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactDetailsPage extends StatelessWidget {
  final Kontakt kontakt;

  ContactDetailsPage(this.kontakt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kontakt.nazwaKontaktu),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('=> Nazwa Kontaktu: ${kontakt.nazwaKontaktu}'),
            Text('=> Relacja Rodzinna: ${kontakt.relacjaRodzinna}'),
            Text('=> Numer Telefonu: ${kontakt.numerTelefonu}'),
            Image.asset(kontakt.zdjecieDoKontaktu, width: 100, height: 100),
          ],
        ),
      ),
    );
  }
}
