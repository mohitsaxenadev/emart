import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//own imports
import 'package:emart/components/horizontal_listview.dart';
import 'package:emart/components/products.dart';
import 'package:emart/components/pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg')
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotColor: Colors.white,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink,
        title: new Text("E Mart"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search), color: Colors.white, onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              }),
        ],
      ),
      drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              //header
              new UserAccountsDrawerHeader(
                accountName: new Text("Name"),
                accountEmail: new Text("E-mail"),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: new Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                ),
                decoration: new BoxDecoration(color: Colors.pink),
              ),
              //body
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: new Text("Home"),
                  leading: Icon(Icons.home, color: Colors.pink),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: new Text("Account"),
                  leading: Icon(Icons.person, color: Colors.pink),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: new Text(" My Orders"),
                  leading: Icon(Icons.shopping_basket, color: Colors.pink),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: new Text("Wishlist"),
                  leading: Icon(Icons.favorite, color: Colors.pink),
                ),
              ),

              Divider(),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: new Text("Settings"),
                  leading: Icon(Icons.settings, color: Colors.blue),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: new Text("About"),
                  leading: Icon(Icons.help, color: Colors.green),
                ),
              )
            ],
          )),
      body: new Column(
        children: <Widget>[
          //carousel
          image_carousel,
          //padding
          new Padding(padding: const EdgeInsets.all(8.0)),
          //horizontal listview
          HorizontalList(),
          new Padding(padding: const EdgeInsets.all(8.0)),
          //grid view
          Flexible(
            child: Products(),
          )
        ],
      ),
    );
  }
}
