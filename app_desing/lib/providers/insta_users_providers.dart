import 'package:app_desing/modelos/instagram_users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';



class InstagramProviders {
  final URL = "reqres.in";
  int _pagesusers = 1;
  bool _cargando = false;


  List<UserIntagram> userinstagram = new List();

  final _usersStreamController = StreamController<Lis<UserIntagram>>.broadcast();

  Function(List<UserIntagram>) get userSink => 
  _usersStreamController.sink.add;


  Stream<List<UserIntagram>> get userStream => 
  _usersStreamController.stream;

  void closeStream(){
    _usersStreamController?.close();
  }


  Future<List<UserIntagram>> getuser() async {
    if(_cargando) return [];
    _cargando = true;

    this._pagesusers ++;

    final urlusers = Uri.https(URL, 'api/users?page=$_pagesusers');
    final response  = await _proccesingResponse(urlusers);
    this.userinstagram.addAll(response);
    
    userSink(this.userinstagram);
    _cargando = false;
    return response;
    

  }


  Future<List<UserIntagram>> _proccesingResponse(Uri urlusers) async {
    final response  = await http.get(urlusers);
    final decodeData  = json.decode(response.body);
    print(decodedData);
    final users = new Users.fromJsonList(decodeData['data']);

    return users.userInsta ;
  } 



}
