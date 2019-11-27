import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'images/cats/tshirt.png',
            imageCaption: "T-Shirts",
          ),
          Category(
            imageLocation: 'images/cats/dress.png',
            imageCaption: "Dresses",
          ),
          Category(
            imageLocation: 'images/cats/jeans.png',
            imageCaption: "Jeans",
          ),
          Category(
            imageLocation: 'images/cats/shoe.png',
            imageCaption: "Shoes",
          ),
          Category(
            imageLocation: 'images/cats/formal.png',
            imageCaption: "Formals",
          ),
          Category(
            imageLocation: 'images/cats/informal.png',
            imageCaption: "Casuals",
          ),
          Category(
            imageLocation: 'images/cats/accessories.png',
            imageCaption: "Accessories",
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this.imageLocation, this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.asset(imageLocation, height: 100.0, width: 80.0),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: new Text(imageCaption,
                    style: new TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold)),
              )),
        ),
      ),
    );
  }
}
