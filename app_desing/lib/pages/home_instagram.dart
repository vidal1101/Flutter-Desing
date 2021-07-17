import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeInstagram extends StatefulWidget {
  @override
  _HomeInstagramState createState() => _HomeInstagramState();
}

class _HomeInstagramState extends State<HomeInstagram> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModal(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Instagram'),
          actions: <Widget>[
            Container(
                padding: EdgeInsets.all(3.0),
                margin: EdgeInsets.only(right: 5.0),
                child: Icon(Icons.add_box_outlined)),
            Container(
                padding: EdgeInsets.all(3.0),
                margin: EdgeInsets.only(right: 5.0),
                child: Icon(Icons.favorite_border)),
            Container(
                padding: EdgeInsets.all(3.0),
                margin: EdgeInsets.only(right: 5.0),
                child: Icon(Icons.message)),
          ],
        ),
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegar = Provider.of<_NavegacionModal>(context);
    return PageView(
      controller: navegar.pageControler,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ), //seccion de noticias
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.white30,
        ),
        Container(
          color: Colors.green,
        ),
        Container(color: Colors.yellow), //sesion de emcabezados
        //Container(color: Colors.purpleAccent),
        //
      ],
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // obtengo la instancia de la clase singleton.
    final navegar = Provider.of<_NavegacionModal>(context);

    return BottomNavigationBar(
        currentIndex: navegar.paginaActual,
        onTap: (i) {
          print("$i");
          navegar.paginaActual = i;
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection_outlined,
                color: Colors.black,
              ),
              title: Text('Reels')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop_outlined,
                color: Colors.black,
              ),
              title: Text('Shop')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin,
                color: Colors.black,
              ),
              title: Text('Profile')),
        ]);
  }
}

/**
 * clase con patron mediador singleton. 
 */
class _NavegacionModal with ChangeNotifier {
  int _paginaActual = 0;

  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  PageController get pageControler => this._pageController;

  /**
   * setter para cambiar la pagina actual.
   */
  set paginaActual(int valor) {
    this._paginaActual = valor;
    /**se navega por l paginas porque el getter se establece en el pageview en el controller */
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 450), curve: Curves.decelerate);
    notifyListeners();
  }
}