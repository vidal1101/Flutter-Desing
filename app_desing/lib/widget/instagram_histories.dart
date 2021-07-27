import 'package:flutter/material.dart';
import 'package:app_desing/modelos/instagram_users.dart';

class Instagram_HistoriesUsers extends StatelessWidget {

  final List<UserIntagram> users;
  // esta funcion manda a llamar la siguiente data  a traves del evento controller
  final Function siguientehistoriesUsers;

  Instagram_HistoriesUsers(
      {Key key, @required this.users, @required this.siguientehistoriesUsers})
      : super(key: key);

  // evento para saber que acerca al final y cargar mas data y viewportfraccion para la cantidad de pageview 
  //  a mostrar en la pantalla
  final PageController controller =
      new PageController(initialPage: 2, viewportFraction: 0.2);

  @override
  Widget build(BuildContext context) {
    final mediaq = MediaQuery.of(context).size;

    /**
     * cuando se acerca al final realiza la peticion,
     * asi inmediamenta las cargas las nuevas historias d  usuarios
     * 
     */
    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 250) {
        this.siguientehistoriesUsers();
      }
    });

    return Container(
      height: 100,
      child: PageView.builder(
        pageSnapping: false, // mayor mobilidad al scrool del pageview.
        scrollDirection: Axis.horizontal,
        controller: controller,
        //children: _tarjets(),
        itemCount: this.users.length,
        itemBuilder: (_, i) {
          print("1 nombre del page view "+users[i].firstName.toString());
          return _tarjeta(_, this.users[i]);
        },
      ),
    );
  }

  Widget _tarjeta(BuildContext context, UserIntagram user) {
    final _tarjeta = Container(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[

          ClipRRect(
            borderRadius: BorderRadius.circular(110.0),
            child: FadeInImage(
              fadeInDuration: Duration(seconds: 1),
              placeholder: NetworkImage('https://suhsport.es/img/noImage.jpg'),
              image: NetworkImage(user.avatar),
              fit: BoxFit.cover,
              height: 60.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            user.firstName,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

    return GestureDetector(
      child: _tarjeta,
      onTap: () {
        // Navigator.pushNamed(context, 'detalle' , arguments: historia);
      },
    );
  }
}
