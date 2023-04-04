import 'dart:async';

import 'package:app_movil/models/mantenimiento_model.dart';
import 'package:flutter/material.dart';

import 'ficha_tecnica_screen.dart';

class DetalleScreen extends StatefulWidget {
  final Mantenimiento mantenimiento;
  const DetalleScreen({required this.mantenimiento, Key? key})
      : super(key: key);

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  final _stopwatch = Stopwatch();
  bool _isRunning = false;

  //indica que la inicialización de la variable se pospone hasta que se hace referencia a ella por primera vez.
  late Timer _timer;

  //correcion para que se inicialize antes de su primer uso
  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration.zero, () {});
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer.cancel(); // cancelar el timer al destruir el widget
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('¿Estás seguro de que quieres salir?'),
            content: Text('Perderás todo el progreso de este mantenimiento.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Sí'),
              ),
            ],
          ),
        )) ??
        false;
  }

  void _startStopwatch() {
    setState(() {
      _isRunning = true;
    });
    _stopwatch.start();
    _timer = Timer.periodic(Duration(seconds: 1),
        (_) => setState(() {})); // actualizar el tiempo cada segundo
  }

  void _stopStopwatch() {
    setState(() {
      _isRunning = false;
    });

    _stopwatch.stop();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FichaTecnicaScreen()),
    );
    _timer.cancel(); // cancelar el timer al detener el cronómetro
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalles del Mantenimiento'),
          backgroundColor: Colors.orange,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              initialValue: widget.mantenimiento.cliente.nombre,
              decoration: const InputDecoration(
                labelText: 'Nombre del Cliente',
              ),
              readOnly: true,
            ),
            TextFormField(
              initialValue: widget.mantenimiento.cliente.direccion,
              decoration: const InputDecoration(
                labelText: 'Dirección del Cliente',
              ),
              readOnly: true,
            ),
            TextFormField(
              initialValue: widget.mantenimiento.cliente.telefono,
              decoration: const InputDecoration(
              labelText: 'Telefono del Cliente',
            ),
            readOnly: true,
          ),
          TextFormField(
            initialValue: widget.mantenimiento.equipo.nombre,
            decoration: const InputDecoration(
              labelText: 'Nombre del Equipo',
            ),
            readOnly: true,
          ),
          TextFormField(
            initialValue: widget.mantenimiento.equipo.serie,
            decoration: const InputDecoration(
              labelText: 'No Serie del Equipo',
            ),
            readOnly: true,
          ),
          TextFormField(
            initialValue: widget.mantenimiento.equipo.descripcion,
            decoration: const InputDecoration(
              labelText: 'Tipo de Equipo',
            ),
            readOnly: true,
          ),
          TextFormField(
            initialValue: widget.mantenimiento.tipomantenimiento,
            decoration: const InputDecoration(
              labelText: 'Tipo de Mantenimiento',
            ),
            readOnly: true,
          ),
          TextFormField(
            initialValue: widget.mantenimiento.descripcion,
            decoration: const InputDecoration(
              labelText: 'Descripción del Mantenimiento',
            ),
            readOnly: true,
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: _isRunning ? null : _startStopwatch,
                  child: const Text('Comenzar Mantenimiento'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                  )),
              ElevatedButton(
                  onPressed: !_isRunning ? null : _stopStopwatch,
                  child: const Text('Terminar Mantenimiento'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                  )),
            ],
          ),
          Center(
            child: Text(
              _formatDuration(_stopwatch.elapsed),
              style: const TextStyle(fontSize: 48),
            ),
          ),
        ],
      ),
    )
    );
  }
}
