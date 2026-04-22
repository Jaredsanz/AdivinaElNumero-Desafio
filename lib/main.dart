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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: columnaConBorde('Mayor que'),
            ),
            SizedBox(width: 12),
            Expanded(
              child: columnaConBorde('Menor que'),
            ),
            SizedBox(width: 12),
            Expanded(
              child: columnaConBorde('Historial'),
            ),
          ],
        ),
      ),
    );
  }

  Widget columnaConBorde(String titulo) {
    return Container(
      height: 350,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            titulo,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}