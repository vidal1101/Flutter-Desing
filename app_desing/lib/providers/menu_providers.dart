
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class MenuProviders {
  List<dynamic> opciones = [];

  MenuProviders() {
    cargarDatos();
  }

  Future<List<dynamic>> cargarDatos() async {
    final respo = await rootBundle.loadString('data/menu_opc.json');
    Map datamap = json.decode(respo);

    opciones = datamap['rutas'];
    return opciones;
  }
}

final menuProviders = new MenuProviders();
