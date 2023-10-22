import 'package:flutter/material.dart';

void main() {
  runApp(const Abc());
}

class Abc extends StatelessWidget {
  const Abc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text("Abc flutter"),
                backgroundColor: Colors.amber
            ),
            body: Container(
                alignment: Alignment.center,
                color: Colors.deepOrange,
                width: 200,
                height: 150,
                child: Text("Hello world! :>", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ))
            )
        ) // szkielet aplikacji - scaffold
    );
  }
}