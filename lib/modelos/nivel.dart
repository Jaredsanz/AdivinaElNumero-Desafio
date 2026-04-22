class Nivel {
  final String nombre;
  final int numeroMaximo;
  final int intentosMaximos;

  Nivel({
    required this.nombre,
    required this.numeroMaximo,
    required this.intentosMaximos
  });
}

final List<Nivel> niveles = [
  Nivel(nombre: 'Facil', numeroMaximo: 10, intentosMaximos: 5),
  Nivel(nombre: 'Normal', numeroMaximo: 20, intentosMaximos: 8),
  Nivel(nombre: 'Dificil', numeroMaximo: 100, intentosMaximos: 15),
  Nivel(nombre: 'Extremo', numeroMaximo: 1000, intentosMaximos: 25),
];