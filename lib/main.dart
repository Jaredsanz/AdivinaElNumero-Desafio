import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adivina el Numero',
      theme: ThemeData.dark(),
      home: PantallaJuego(),
    );
  }
}

class PantallaJuego extends StatefulWidget {
  @override
  State createState() {
    return EstadoPantallaJuego();
  }
}

class EstadoPantallaJuego extends State<PantallaJuego> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivina el Numero'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Jared'),
      ),
    );
  }
}