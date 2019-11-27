import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 3100,
      "size": "L",
      "color": "Black",
      "quantity": 1
    },
    {
      "name": "Dress",
      "picture": "images/products/dress1.jpeg",
      "price": 2500,
      "size": "M",
      "color": "Red",
      "quantity": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: productsOnTheCart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartProductName: productsOnTheCart[index]["name"],
            cartProductPic: productsOnTheCart[index]["picture"],
            cartProductPrice: productsOnTheCart[index]["price"],
            cartProductSize: productsOnTheCart[index]["size"],
            cartProductColor: productsOnTheCart[index]["color"],
            cartProductQty: productsOnTheCart[index]["quantity"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProductName;
  final cartProductPic;
  final cartProductPrice;
  final cartProductSize;
  final cartProductColor;
  final cartProductQty;

  SingleCartProduct(
      {this.cartProductPrice,
      this.cartProductName,
      this.cartProductPic,
      this.cartProductColor,
      this.cartProductQty,
      this.cartProductSize});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //leading section==================================================
        leading: new Image.asset(cartProductPic, width: 80.0, height: 80.0),

        //title section========================
        title: new Text(cartProductName),

        //subtitle section=====================
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                //size==============================
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: new Text(
                    cartProductSize,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),

                //color==============================
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cartProductColor),
                ),
              ],
            ),

            //product price=============================
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\₹${cartProductPrice}",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.arrow_drop_up), iconSize: 50.0,onPressed: (){}),
              new Text("${cartProductQty}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60.0),),
              new IconButton(icon: Icon(Icons.arrow_drop_down), iconSize: 50.0, onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
