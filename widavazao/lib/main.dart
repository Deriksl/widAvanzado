import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView( // Permite hacer scroll si los widgets se salen de la pantalla
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                CustomStackWidget(
                  title: "HTML",
                  subtitle: "Curso",
                  backgroundColor: Colors.blueAccent, // Color de fondo personalizado
                ),
                SizedBox(height: 0), // Espacio pequeño entre las tarjetas
                CustomStackWidget(
                  title: "CSS",
                  subtitle: "Curso",
                  backgroundColor: Colors.redAccent, // Otro color de fondo
                ),
                SizedBox(height: 0), // Espacio pequeño entre las tarjetas
                CustomStackWidget(
                  title: "JavaScript",
                  subtitle: "Curso",
                  backgroundColor: Colors.yellow, // Otro color de fondo
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomStackWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;

  CustomStackWidget({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30), // Curva en la esquina inferior izquierda
      ),
      child: Stack(
        children: [
          Container(
            height: 150, // Altura de cada tarjeta
            width: double.infinity, // Ancho completo de la pantalla
            color: backgroundColor, // Color de fondo de la tarjeta
          ),
          // Degradado en la parte inferior para mejorar la legibilidad
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black54],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Posiciona el texto en la parte inferior izquierda
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white, // Color del texto principal
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white70, // Color del texto secundario
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}