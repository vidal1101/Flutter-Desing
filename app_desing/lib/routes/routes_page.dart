import 'package:app_desing/pages/home_instagram.dart';
import 'package:flutter/material.dart';

import 'package:app_desing/pages/home_page.dart';


/**
 * 
 * mapa que carga las rutas de acuerdo a un .json en la carpeta data. 
 * 
 */
Map<String, WidgetBuilder> getAplicationsRoutes (){
  return <String, WidgetBuilder>{

    '/'           : (BuildContext context) => HomePage(),
    'instagram'   : (_) => HomeInstagram(),

  };

}