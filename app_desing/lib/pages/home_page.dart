import 'package:app_desing/providers/menu_providers.dart';
import 'package:app_desing/widget/icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App desing'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
        future: menuProviders.cargarDatos(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {

            return ListView(
              children: _listaItems(snapshot.data, context),
            );
          } else {

            print('se carga un progress indicator');
          }
        });
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final wiggetTemporal = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.exit_to_app, color: Colors.deepPurple),
        onTap: () {
          /*
          final ruta = MaterialPageRoute(builder: (context) => AlertsPage());
          Navigator.push(context, ruta);
          */
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones..add(wiggetTemporal)..add(Divider());
    });

    return opciones;
  }
}
