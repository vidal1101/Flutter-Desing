
/**
 * 
 * clase para almacenar los usuarios de tipo usuario.
 * recoge en una lista y los almacena. 
 */

class Users {
  List<UserIntagram> userInsta = new List();

  Users();

  Users.fromJsonList( List<dynamic> jsonlist){
    if(jsonlist == null )return;

    for(var user in jsonlist){
      final userNew = new UserIntagram.fromJsonMap(user);
      userInsta.add(userNew);
    }

  }

}




/**
 * clase modelo para crear un usuario de acuerdo del json
 * para luego formar objetos dentro de la lista de users
 */
class UserIntagram {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UserIntagram({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  UserIntagram.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  getAvatarUsers() {
    if (avatar == null) {
      return 'https://suhsport.es/img/noImage.jpg';
    } else {
      return 'https://reqres.in/img/faces/$avatar';
    }
  }
}
