import 'package:flutter/material.dart';

class InstagramShop extends StatefulWidget {
  @override
  _InstagramShopState createState() => _InstagramShopState();
}

class _InstagramShopState extends State<InstagramShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          createAppbar(),
          categoriesShopListHorizontal(context),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              color: Colors.yellowAccent,
              height: 200,
            ),
            Container(
              color: Colors.greenAccent,
              height: 200,
            ),
            Container(
              color: Colors.red,
              height: 450,
            ),
          ])),
        ],
      ),
    );
  }

  /**
   * el widget de SliverAppbar  va antes de slivers, luego todo el body y el posible 
   * scrooll con sus elementos
   */
  Widget createAppbar() {
    return SliverAppBar(
      elevation: 9.0,
      expandedHeight: 125.0,
      backgroundColor: Colors.indigoAccent,
      floating: true,
      pinned: true,
      snap: true,
      title: Text('Shop'),
      actions: [
        Icon(Icons.save_alt_rounded),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.dehaze_outlined),
        SizedBox(
          width: 20,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: _inputSearchShop(),
        //background: Text('Shop'),
      ),
    );
  }

  /**
   * filtro de busqueda de shop
   */
  Widget _inputSearchShop() {
    return Container(
      height: 30,
      //color: Colors.amber,
      child: TextField(
        autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          //counter: Text('cantidad de letras: ${_nombre.length}'),
          hintText: '',
          labelText: 'Buscar',
          //helperText: 'Solo el nombre',
          prefixIcon: Icon(Icons.search_outlined),
          //suffixIcon: Icon(Icons.accessibility),
        ),
        onChanged: (valor) {
          setState(() {});
        },
      ),
    );
  }

/**
 * lista horizontal despues del sliverappbar. 
 * para mostrar las categorias de la tienda
 */
  Widget categoriesShopListHorizontal(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 110.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Colecciones ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            );
          },
        ),
      ),
    );
  }
}
