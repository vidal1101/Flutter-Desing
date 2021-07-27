import 'package:flutter/material.dart';

class InstagramProfile extends StatefulWidget {
  @override
  _InstagramProfileState createState() => _InstagramProfileState();
}

class _InstagramProfileState extends State<InstagramProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarProfile(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerProfile(),
            informationProfile(),
            bodyPublicationsProfile(),
          ],
        ),
      ),
    );
  }

  /******************************   metodos                       *********************** */

  // informacion del perfil con sus iconos
  Widget appbarProfile() {
    return AppBar(
      title: Text('Robert_7 '),
      actions: [
        IconButton(icon: Icon(Icons.expand_more_sharp), onPressed: () {}),
        SizedBox(
          width: 40,
        ),
        IconButton(icon: Icon(Icons.add_box_outlined), onPressed: () {}),
        IconButton(icon: Icon(Icons.dehaze), onPressed: () {}),
      ],
    );
  }

  // seccion de cabecera , datos de seguidores, publicaciones etc
  Widget headerProfile() {
    return Container(
      //color: Colors.yellow,
      //height: 200,
      child: Column(
        children: [
          SizedBox(
            height: 190,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                avatarProfile(),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  height: 65,
                  child: Column(
                    children: [
                      Text('152'),
                      Text('Publicac..'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 65,
                  child: Column(
                    children: [
                      Text('1256'),
                      Text('Seguidor..'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 65,
                  child: Column(
                    children: [
                      Text('13525'),
                      Text('Seguidos'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //el avatar del perfil.
  Widget avatarProfile() {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          CircleAvatar(
            radius: 45.0,
            backgroundImage: NetworkImage(
                'https://www.okchicas.com/wp-content/uploads/2015/08/artista-combina-rostros-de-famosos-23.jpg'),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Robert Dimaria'),
          Text('Actor'),
          Text('Estrella de cine')
        ],
      ),
    );
  }

  Widget informationProfile() {
    return Container(
      //color: Colors.yellow,
      // height: 100,
      child: Column(
        children: [
          SizedBox(
            width: 15,
          ),
          Container(
            height: 40,
            width: 325,
            child:
                ElevatedButton(onPressed: () {}, child: Text('Editar Perfil')),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              ButtonBar(
                children: [Text('Promociones')],
              ),
              ButtonBar(
                children: [Text('Estadisticas')],
              ),
              ButtonBar(
                children: [Text('Contacto')],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          historiesProfile(),
        ],
      ),
    );
  }

  Widget historiesProfile() {
    final sizewith = SizedBox(
      width: 15,
    );
    return Row(
      children: [
        sizewith,
        Column(
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage(
                  'https://ximagen.com/images/2019/04/16/iconoavion.md.jpg'),
            ),
            Text('Travels'),
          ],
        ),
        sizewith,
        Column(
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/75/a9/7c/75a97c2506eb8dcd0c77d41fb8a1d9e3.jpg'),
            ),
            Text('Gym'),
          ],
        ),
        sizewith,
        Column(
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/cb/a9/06/cba9063a4800ed0f1e9a0318049fb98b.jpg'),
            ),
            Text('Love'),
          ],
        ),
        sizewith,
        Column(
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/a8/21/7b/a8217bf4ce7ec439038af2a75c8e5074.jpg'),
            ),
            Text('Photos'),
          ],
        ),
      ],
    );
  }

  Widget bodyPublicationsProfile() {
   
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(width: 100,),
              Icon(Icons.grid_on_rounded),
              SizedBox(width: 95,),
              Icon(Icons.person_pin_rounded)
            ],
          ),
        ),
        GridView.builder(
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
        ),
      ],
    );
  }
}
