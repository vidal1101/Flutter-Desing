import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

final URL = "reqres.in";

class InstagramHistories extends StatefulWidget {
  @override
  _InstagramHistoriesState createState() => _InstagramHistoriesState();
}

class _InstagramHistoriesState extends State<InstagramHistories>
    with AutomaticKeepAliveClientMixin {
  List<dynamic> userdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    // aqui cargo la data

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            histories(context),
            Divider(
              color: Colors.black38,
            ),
            // _ListHistories(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
  // mantiene el widget y no lo redibuja  aunque cambie de pagina

/**
 * 
 * metodo que recibe la data de la api y renderizada la seccion de historias
 */
  Widget histories(BuildContext context) {
    if (userdata.length == null || userdata.length == 0) {
      progress();
    }
    return Container(
      width: double.infinity,
      height: 123,
      //color: Colors.red,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: userdata.length == null ? 0 : userdata.length,
          itemBuilder: (BuildContext context, int index) {
            /**conentir a mayuscuslas */
            final cName = userdata[index]["first_name"];

            return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(userdata[index]["avatar"]),
                      ),
                    ),
                    //_CategoriaButton(categorias: categorias.userdata[index]),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
                  ],
                ));
          }),
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
          Text('LOADING NEWS ...'),
        ],
      ),
    );
  }

  /**
   * peticion al webserver 
   */
  Future<dynamic> getUsers() async {
    final url = Uri.http(URL.toString(), 'api/users/');
    final resp = await http.get(url);
    Map decodedData = json.decode(resp.body);
    print(decodedData);
    setState(() {
      this.userdata = decodedData['data'];
    });
  }
}
