import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final heroTag;
  final pokemonDetail;
  final Color color;

  const DetailScreen({
    Key? key,
    required this.heroTag,
    required this.pokemonDetail,
    required this.color,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.pokemonDetail);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
            left: 5,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 70,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.pokemonDetail['name'],
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "#" + widget.pokemonDetail['num'],
                  style: TextStyle(color: Colors.white, fontSize: 20, ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Positioned(
            top: 110,
            left: 22,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.pokemonDetail['type'].join(", "),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          Positioned(
            top: height * 0.18,
            right: -30,
            child: Image.asset(
              'images/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    // ... rest of your code ...
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * 0.2),
            left: (width / 2) - 100,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                height: 200,
                width: 200,
                imageUrl: widget.pokemonDetail['img'],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
