import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

final URL = "reqres.in";

class New_serviceinstagram with ChangeNotifier {

  List<dynamic> userdata;

  New_serviceinstagram(){
    getUsers();
  }

  Future<dynamic> getUsers() async {
    final url = Uri.http(URL.toString(), 'api/users/');
    final resp = await http.get(url);
    Map decodedData = json.decode(resp.body);
    print(decodedData);
    this.userdata = decodedData['data'];

    return this.userdata;
  }
}
