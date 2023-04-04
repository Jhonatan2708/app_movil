import 'package:app_movil/screens/mantenimientos_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gestion de Mantenimientos'),
          backgroundColor: Colors.orange,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido a la aplicación de gestión de mantenimientos',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 300,
              width: 450,
              child: Image.asset(
                'assets/logo.jpg',
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MantenimientosScreen()),
                );
              },
              icon: const Icon(Icons.build),
              label: const Text('Iniciar Mantenimiento'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Ventana1Screen()),
                );*/
              },
              icon: const Icon(Icons.history),
              label: const Text('Historial de Mantenimientos'),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[800], // Cambiar el color de fondo
                onPrimary: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16), // Aumentar el tamaño del botón
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ],
        )));
  }
}
