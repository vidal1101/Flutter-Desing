import 'package:app_desing/modelos/instagram_news.dart';
import 'package:flutter/material.dart';

class InstagramBody extends StatefulWidget {
  final List<Article> noticiaInsta;

  const InstagramBody(this.noticiaInsta);

  @override
  _InstagramBodyState createState() => _InstagramBodyState();
}

class _InstagramBodyState extends State<InstagramBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(slivers: <Widget>[
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          print("noticia " + this.widget.noticiaInsta[index].title.toString());

          return Opacity(
            opacity: 0.9,
            child: Noticia(
              noticia: this.widget.noticiaInsta[index],
              index: index,
            ),
          );
        }))
      ]),
    );
  }
}

/**
 * clase que pinta en patalla cada noticia y llama  otras clases segun la seccion 
 * de la tarjeta 
 * 
 */
class Noticia extends StatelessWidget {
  const Noticia({this.noticia, this.index});

  final int index;
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _Tabtopbar(
          noticia: noticia,
          index: index,
        ),
        Transform.scale(
          scale: 0.9,
          child: _TarjeImagen(
            noticia: this.noticia,
            index: index,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        _TarjetBody(noticia: this.noticia),
        SizedBox(
          height: 10,
        ),
        _Botones(
          noticia: this.noticia,
          index: index,
        ),
        Divider(
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _Tabtopbar extends StatelessWidget {
  const _Tabtopbar({this.noticia, this.index});

  final int index;
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}',
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(
            width: 10,
          ),
          Text('${noticia.source.name}'),
        ],
      ),
    );
  }
}

/**
 * carga la imagen de la noticia  a traves de clases reutilizables. 
 */
class _TarjeImagen extends StatelessWidget {
  const _TarjeImagen({this.noticia, this.index});

  final int index;
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
          child: (noticia.urlToImage != null)
              ? FadeInImage(
                  placeholder:
                      NetworkImage('https://suhsport.es/img/noImage.jpg'),
                  fadeInDuration: Duration(seconds: 2),
                  image: NetworkImage(noticia.urlToImage),
                )
              : Image(
                  image: NetworkImage('https://suhsport.es/img/noImage.jpg'))),
    );
  }
}

class _TarjetBody extends StatelessWidget {
  final Article noticia;

  const _TarjetBody({this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Text((noticia.description != null) ? noticia.description : ''),
    );
  }
}

class _Botones extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Botones({Key key, this.noticia, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              print(noticia.description);

              //con el navigator.of lo puedo lanzar a otra ventana para ver mas informacion.
            },
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            child: Icon(Icons.more_outlined),
          ),
        ],
      ),
    );
  }
}
