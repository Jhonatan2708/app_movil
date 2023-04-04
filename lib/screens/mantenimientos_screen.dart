import 'package:app_movil/models/mantenimiento_model.dart';
import 'package:app_movil/utils/conection.dart';
import 'package:flutter/material.dart';

import '../models/cliente_model.dart';
import '../models/equipo_model.dart';
import 'detalle_mantenimiento_screen.dart';

class MantenimientosScreen extends StatefulWidget {
  const MantenimientosScreen({Key? key}) : super(key: key);

  @override
  State<MantenimientosScreen> createState() => _MantenimientosScreenState();
}

class _MantenimientosScreenState extends State<MantenimientosScreen> {
  @override
  Widget build(BuildContext context) {
    /*final listaMantenimientos = <Mantenimiento>[
      Mantenimiento(
          cliente: Cliente(
              nombre: 'Jhonatan Revelo',
              direccion: 'Galapagos',
              telefono: '0964157898'),
          descripcion: 'No presenta incombeniente',
          tipomantenimiento: 'Preventivo',
          equipo: Equipo(
              nombre: 'Cocina', descripcion: 'Industrial', serie: '036154')),
      Mantenimiento(
          cliente: Cliente(
              nombre: 'Jose Espinosa',
              direccion: 'Guayaquil',
              telefono: '0964155566'),
          descripcion: 'Fuga de agua',
          tipomantenimiento: 'Correctivo',
          equipo: Equipo(
              nombre: 'Lavadora', descripcion: 'Domestico', serie: '047526')),
      Mantenimiento(
          cliente: Cliente(
              nombre: 'Alfredo Andretti',
              direccion: 'Cuenca',
              telefono: '0927894632'),
          descripcion: 'No esta congelando los alimentos',
          tipomantenimiento: 'Correctivo',
          equipo: Equipo(
              nombre: 'Congelador',
              descripcion: 'Industrial',
              serie: '072546')),
    ];*/
    var listaMantenimientos = Conection.httpMantenimientosConection;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mantenimientos'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: const Color.fromARGB(255, 223, 222, 219),
      body: ListView.builder(
        itemCount: listaMantenimientos.length,
        itemBuilder: (BuildContext context, int index) {
          final mantenimiento = listaMantenimientos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.build),
              title: Text('Cliente: ${mantenimiento.cliente.nombre}',style: const TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Equipo: ${mantenimiento.equipo.nombre}',style: const TextStyle(fontWeight: FontWeight.bold),),
                  Text('Tipo de Equipo: ${mantenimiento.equipo.descripcion}',),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  DetalleScreen(mantenimiento: mantenimiento,)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
