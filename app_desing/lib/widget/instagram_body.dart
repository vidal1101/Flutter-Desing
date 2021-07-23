import 'package:app_desing/providers/insta_news_providers.dart';
import 'package:app_desing/services/instagram_histories_services.dart';
import 'package:app_desing/widget/instagram_histories.dart';
import 'package:app_desing/widget/instagram_news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final newservice = Provider.of<New_Service>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // revisar el snglechilscroolview sino se cambia por container
        child: Column(
          children: <Widget>[
            historiasStream(),
            Divider(
              color: Colors.black38,
            ),
            newsbody(),
            //InstagramBody(newservice.headers),
          ],
        ),
      ),
    );
  }

/**
 * muestro las historias desde un stream y las renderizo en una pantalla por aparte. 
 * toda la logica en el stream builder. 
 * sorry por todos los print de prueba 
 * 
 */
  Widget historiasStream() {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
              stream: this.userProvider.userStream,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return Instagram_HistoriesUsers(
                      // esta clase de encarga de manipular y pintar las hostorias
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

  Widget newsbody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              //color: Colors.blue,
              child: Center(
                child: Card(
                  child: Column(
                    children: [
                      const ListTile(
                        leading: Icon(Icons.album),
                        title: Text('Titulo de Tarjeta'),
                        subtitle: Text(
                            'Subtiulo de tarjeta'),
                      ),
                      FadeInImage(
                        fadeInDuration: Duration(seconds: 2),
                        placeholder: NetworkImage('http://fremontgurdwara.org/wp-content/uploads/2020/06/no-image-icon-2.png'),
                        image:NetworkImage('https://hddesktopwallpapers.in/wp-content/uploads/2015/09/wyoming-wallpaper.jpg') ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: const Text('botton 1'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('botton 2'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          Container(
            color: const Color(0xffeeee00),
            height: 300.0,
            alignment: Alignment.center,
            child: const Text('Segundo Contenedor de prueba'),
          ),

          Container(


          ),
          
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

  @override
  bool get wantKeepAlive => true;
  // mantiene el widget y no lo redibuja  aunque cambie de pagina

}
