import 'package:flutter/material.dart';
import 'modelos/nivel.dart';

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
  final TextEditingController controladorNumero = TextEditingController();
  int nivelActual = 0;
  late int intentosRestantes = niveles[nivelActual].intentosMaximos;

  @override
  Widget build(BuildContext context) {
    Nivel nivel = niveles[nivelActual];

    return Scaffold(
      appBar: AppBar(
        title: Text('Adivina el Numero'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controladorNumero,
                    decoration: InputDecoration(
                      labelText: 'Numbers',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      Text('Intentos', style: TextStyle(fontSize: 18)),
                      Text(
                        intentosRestantes.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
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
            SizedBox(height: 24),
            Text(
              nivel.nombre,
              style: TextStyle(fontSize: 16),
            ),
            Slider(
              value: nivelActual.toDouble(),
              min: 0,
              max: 3,
              divisions: 3,
              onChanged: (double valor) {
                setState(() {
                  nivelActual = valor.toInt();
                  intentosRestantes = niveles[nivelActual].intentosMaximos;
                });
              },
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