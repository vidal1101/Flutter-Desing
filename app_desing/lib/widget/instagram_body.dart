
import 'package:flutter/material.dart';

import 'package:app_desing/widget/instagram_histories.dart';
import 'package:app_desing/providers/insta_users_providers.dart';
import 'dart:async';



// LA URL DE LOS PERFILES PARA LAS HISTORIAS
final URL = "reqres.in";

class InstagramHistories extends StatefulWidget {
  @override
  _InstagramHistoriesState createState() => _InstagramHistoriesState();
}

class _InstagramHistoriesState extends State<InstagramHistories>
    with AutomaticKeepAliveClientMixin {
  //variables de la imagenes cargadas 
  List<int> _listaImagenes = new List();
  int _ultimaItemImage = 0;
  bool isLoading = false;

  ScrollController _scrollControlle = new ScrollController();
  //overide
  @override
  void initState() {
    super.initState();
    _agregarImagenes();

    _scrollControlle.addListener(() {
      if (_scrollControlle.position.pixels ==
          _scrollControlle.position.maxScrollExtent) _fetchData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollControlle.dispose();
  }

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

    return Scaffold( //revisar la forma para acomodar el stack
      body: Stack(
        children: [
          _crearLista(),
          _crerLoading(),
          Column(
            children: [
              historiasStream(),
            ],
          ),
        ],
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
      color: Colors.white,
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

/**....................................... METODOS NEWS .............................. */

  void _agregarImagenes() {
    for (var i = 0; i < 10; i++) {
      _ultimaItemImage++;
      _listaImagenes.add(_ultimaItemImage);
    }
    setState(() {});
  }

  Future<dynamic> _fetchData() async {
    isLoading = true;
    setState(() {});

    final duracion = new Duration(seconds: 2);
    return new Timer(duracion, responseHTTTP);
  }

  void responseHTTTP() {
    isLoading = false;

    _scrollControlle.animateTo(_scrollControlle.position.pixels + 175,
        duration: Duration(seconds: 1), curve: Curves.slowMiddle);

    _agregarImagenes();
  }

  Widget _crerLoading() {
    if (isLoading)
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.purple,
              ),
            ],
          ),
        ],
      );
    else
      return Container();
  }

  Future<Null> _newPageImages() {
    final duracion = new Duration(seconds: 1);
    new Timer(duracion, () {
      _listaImagenes.clear();
      _ultimaItemImage++;
      _agregarImagenes();
    });
    return Future.delayed(duracion);
  }

/**
 *
 * metodo del cuerpo de la noticia donde se agrega la noticia de instagram
 */
  Widget _crearLista() {
    return RefreshIndicator(
      color: Colors.orangeAccent,
      onRefresh: _newPageImages,
      child: ListView.builder(
        controller: _scrollControlle,
        itemCount: _listaImagenes.length,
        itemBuilder: (BuildContext context, int indice) {
          final indiceImagen = _listaImagenes[indice];
          return Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                // SizedBox(height: 5.0),
                Divider(
                  color: Colors.black,
                ),
                //SizedBox(height: 20.0),
                // cabecera
                headerNews(),
                //body o imagen
                FadeInImage(
                  fadeInDuration: Duration(seconds: 1),
                  placeholder: NetworkImage(
                      'https://www.uh.edu/pharmacy/_images/students/pcol-pceu/no-image-available-2.jpg'),
                  image: NetworkImage(
                      'https://picsum.photos/500/300/?image=${indiceImagen}'),
                ),
                //footer
                footerNews(),
              ],
            ),
          );
        },
      ),
    );
  }

  /*
  cabecera de cada noticia que se muestra en el home
  */
  Widget headerNews() {
    return Container(
      //color: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          //cabecera
          ClipRRect(
            borderRadius: BorderRadius.circular(110.0),
            child: CircleAvatar(
              child: FadeInImage(
                  fadeInDuration: Duration(seconds: 2),
                  placeholder:
                      NetworkImage('https://suhsport.es/img/noImage.jpg'),
                  image: NetworkImage(
                      'https://i.pinimg.com/originals/4f/5a/d4/4f5ad4a5fe0eaabf1aa5f75b68291ddd.jpg')),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text('Noticia'),
          SizedBox(
            width: 188,
          ),
          Icon(Icons.drag_handle),
        ],
      ),
    );
  }

  /**
   * pie de cabecerca, despues de la imagen
   */
  Widget footerNews() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Icon(Icons.favorite_outline),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.message_outlined),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.share_outlined),
          SizedBox(
            width: 170,
          ),
          Icon(Icons.save_alt_outlined),
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
