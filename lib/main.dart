import 'package:flutter/material.dart';
import 'dart:math';
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
  late int numeroSecreto = generarNumeroSecreto();
  String mensajeError = '';

  @override
  Widget build(BuildContext context) {
    Nivel nivel = niveles[nivelActual];

    return Scaffold(
      appBar: AppBar(
        title: Text('Adivina el Numero (secreto: $numeroSecreto)'),
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
                Expanded(child: columnaConBorde('Mayor que')),
                SizedBox(width: 12),
                Expanded(child: columnaConBorde('Menor que')),
                SizedBox(width: 12),
                Expanded(child: columnaConBorde('Historial')),
              ],
            ),
            SizedBox(height: 24),
            Text(nivel.nombre, style: TextStyle(fontSize: 16)),
            Slider(
              value: nivelActual.toDouble(),
              min: 0,
              max: 3,
              divisions: 3,
              onChanged: (double valor) {
                nivelActual = valor.toInt();
                reiniciarJuego();
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: procesarIntento, child: Text('Adivinar')),
            if (mensajeError.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(mensajeError, style: TextStyle(color: Colors.red)),
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
          Text(titulo, style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }

  int generarNumeroSecreto() {
    Random random = Random();
    int maximo = niveles[nivelActual].numeroMaximo;
    return random.nextInt(maximo) + 1;
  }

  void reiniciarJuego() {
    setState(() {
      numeroSecreto = generarNumeroSecreto();
      intentosRestantes = niveles[nivelActual].intentosMaximos;
      controladorNumero.clear();
      mensajeError = '';
    });
  }

  void procesarIntento() {
    String texto = controladorNumero.text;
    int? numero = int.tryParse(texto);

    if (numero == null) {
      setState(() {
        mensajeError = 'Por favor ingresa un numero valido';
      });
      return;
    }

    Nivel nivel = niveles[nivelActual];
    if (numero < 1 || numero > nivel.numeroMaximo) {
      setState(() {
        mensajeError = 'El numero debe estar entre 1 y ${nivel.numeroMaximo}';
      });
      return;
    }

    setState(() {
      mensajeError = '';
      intentosRestantes--;
      controladorNumero.clear();
    });
  }
}
