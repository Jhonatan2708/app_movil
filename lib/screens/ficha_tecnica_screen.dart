import 'package:app_movil/screens/mantenimientos_screen.dart';
import 'package:flutter/material.dart';

class FichaTecnicaScreen extends StatefulWidget {
  const FichaTecnicaScreen({Key? key}) : super(key: key);

  @override
  _FichaTecnicaScreenState createState() => _FichaTecnicaScreenState();
}

class _FichaTecnicaScreenState extends State<FichaTecnicaScreen> {
  final _formKey = GlobalKey<FormState>();

  String _descripcionMantenimiento = '';
  String _piezasCambiadas = '';
  String _herramientasUtilizadas = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ficha Tecnica'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Herramientas Utilizadas:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Escriba aquí las herramientas utilizadas',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                onChanged: (value) {
                  _herramientasUtilizadas = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese las herramientas utilizadas.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Piezas Cambiadas:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Escriba aquí las piezas cambiadas',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                onChanged: (value) {
                  _piezasCambiadas = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese las piezas cambiadas.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Descripción de Mantenimiento:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Escriba aquí la descripción del mantenimiento',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                onChanged: (value) {
                  _descripcionMantenimiento = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la descripción del mantenimiento.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Aquí podrías enviar los datos a un servidor o base de datos
                      // o hacer lo que necesites con ellos.

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Ficha técnica guardada correctamente.',
                          ),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MantenimientosScreen()),
                      );
                    }
                  },
                  child: const Text('Guardar Ficha Tecnica'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
