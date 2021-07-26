import 'package:flutter/material.dart';

class InstagramSearch extends StatefulWidget {
  @override
  _InstagramSearchState createState() => _InstagramSearchState();
}

class _InstagramSearchState extends State<InstagramSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              ),
              _inputSearch(),
            ],
          ),
          Divider(color: Colors.black),
          bodySearch(),
        ],
      ),
    );
  }

  Widget _inputSearch() {
    return TextField(
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
        icon: Icon(Icons.search_outlined),
        //suffixIcon: Icon(Icons.accessibility),
      ),
      onChanged: (valor) {
        setState(() {});
      },
    );
  }

  // creo el cuerpo de la zona de busqueda
  Widget bodySearch() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 80,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // cantidad de columnas
        mainAxisSpacing: 2, //espacio horizontal 
        crossAxisSpacing: 2, //espacio vertical
        childAspectRatio: 1.0, // tamaño de 0.1 a 1.0  en forma vertical
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.black87,
          child: FadeInImage(
            fadeInDuration: Duration(seconds: 1),
            placeholder: NetworkImage(
                'https://www.uh.edu/pharmacy/_images/students/pcol-pceu/no-image-available-2.jpg'),
            image:
                NetworkImage('https://picsum.photos/500/300/?image=${index}'),
          ),
        );
      },
    );
  }
}
