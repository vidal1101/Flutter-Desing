import 'package:app_desing/widget/instagram_histories.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_desing/providers/insta_users_providers.dart';

final URL = "reqres.in";

class InstagramHistories extends StatefulWidget {
  @override
  _InstagramHistoriesState createState() => _InstagramHistoriesState();
}

class _InstagramHistoriesState extends State<InstagramHistories>
    with AutomaticKeepAliveClientMixin {
  /**
   * se crea una lista de usuarios y la instancia de providers 
   * 
   *  */
  List<dynamic> userdata;
  final userProvider = new InstagramProviders();

  @override
  Widget build(BuildContext context) {
    // aqui cargo la data para ser preparada
    this.userProvider.getuser();

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            historiasStream(),
            Divider(
              color: Colors.black38,
            ),
            // _ListHistories(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
  // mantiene el widget y no lo redibuja  aunque cambie de pagina

/**
 * muestro las historias desde un stream y las renderizo en una pantalla por aparte. 
 * toda la logica en el stream builder. 
 * sorry por todos los print de prueba 
 * 
 */
  Widget historiasStream() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
              stream: this.userProvider.userStream,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  print('cargada la data de usuarios en stream' +
                      snapshot.data.toString());
                  return Instagram_HistoriesUsers( // esta clase de encarga de manipular y pintar las hostorias
                      users: snapshot.data,
                      siguientehistoriesUsers: this.userProvider.getuser);
                  //  progress();
                } else {
                  return progress();
                }
              }),
        ],
      ),
    );
  }



  


  /**
   * prograss indicator
   */
  Widget progress() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: Colors.purple,
          ),
          SizedBox(
            height: 15,
          ),
          Text(' HISTORIES ...'),
        ],
      ),
    );
  }
}
