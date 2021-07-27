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
      body: Container(color: Colors.blue,),
    );
  }

  Widget appbarProfile() {
    return AppBar(
      title: Text('Robert_DiMaria7 '),
      actions: [
        IconButton(icon: Icon(Icons.expand_more_sharp), onPressed: () {}),
        SizedBox(
          width: 30,
        ),
        IconButton(icon: Icon(Icons.dehaze), onPressed: () {}),
        SizedBox(
          width: 30,
        ),
        IconButton(icon: Icon(Icons.add_box_outlined), onPressed: () {})
      ],
    );
  }
}
