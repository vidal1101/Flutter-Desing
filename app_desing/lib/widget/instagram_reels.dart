import 'package:flutter/material.dart';

class InstagramReels extends StatefulWidget {
  @override
  _InstagramReelsState createState() => _InstagramReelsState();
}

class _InstagramReelsState extends State<InstagramReels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          bodyReels(),
        ],
      )),
    );
  }

  Widget bodyReels() {
    final double mediaQueryContainer =
        MediaQuery.of(context).size.height.round() * 0.9;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            height: mediaQueryContainer,
            color: Colors.yellow,
            child: Stack(
              fit: StackFit.loose,
              children: [
                FadeInImage(
                    height: mediaQueryContainer,
                    width: mediaQueryContainer,
                    placeholder: NetworkImage(
                        'https://www.uh.edu/pharmacy/_images/students/pcol-pceu/no-image-available-2.jpg'),
                    image: NetworkImage(
                        'https://k33.kn3.net/taringa/E/8/4/D/9/2/LucasKappo/524.jpg')),
                iconsfotter(),
                Text('tiulo de los reels '),
              ],
            ),
          ),
        ),
        //cada padding contendra un reels
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            height: MediaQuery.of(context).size.height.round() * 0.9,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }

  Widget iconsfotter() {
    final double mediaQueryPosicioned =
        MediaQuery.of(context).size.height.round() * 0.8;

    return Positioned(
      top: mediaQueryPosicioned,
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Icon(Icons.favorite),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.message),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.share),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}
