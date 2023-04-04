import 'dart:convert';
import 'dart:io';

import '../models/cliente_model.dart';
import '../models/equipo_model.dart';
import '../models/mantenimiento_model.dart';

class Conection {
  static Future<List<Mantenimiento>> httpMantenimientosConection() async {
    final listaMantenimientos = <Mantenimiento>[
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
    ];
    var client = HttpClient();
    var stringData = "";

    try {
      HttpClientRequest request = await client.get("localhost", 8080, "/api/V1/7");
      HttpClientResponse response = await request.close();
      stringData = await response.transform(utf8.decoder).join();
      print(stringData);
    } finally {
      client.close();
    }
    return listaMantenimientos;
  }
}
