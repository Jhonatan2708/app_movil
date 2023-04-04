import 'package:app_movil/models/cliente_model.dart';
import 'package:app_movil/models/equipo_model.dart';

class Mantenimiento {
  Cliente cliente;
  String descripcion;
  String tipomantenimiento;
  Equipo equipo;

  Mantenimiento(
    {
      required this.cliente,
      required this.descripcion,
      required this.tipomantenimiento,
      required this.equipo
    }
  );
}