import 'package:flutter/material.dart';

//own imports
import 'package:emart/components/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": "5500",
      "price": "3100"
    },
    {
      "name": "Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": "3500",
      "price": "1200"
    },
    {
      "name": "Heels",
      "picture": "images/products/hills1.jpeg",
      "old_price": "2000",
      "price": "600"
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "old_price": "1800",
      "price": "1100"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleProd(
                productName: productList[index]['name'],
                productPic: productList[index]['picture'],
                productOldPrice: productList[index]['old_price'],
                productPrice: productList[index]['price']),
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final productName;
  final productPic;
  final productOldPrice;
  final productPrice;

  SingleProd(
      {this.productName,
      this.productPic,
      this.productOldPrice,
      this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text("Hero 1"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                //passing product details
                builder: (context) => new ProductDetails(
                      productDetailsName: productName,
                      productDetailsOldPrice: productOldPrice,
                      productDetailsPic: productPic,
                      productDetailsPrice: productPrice,
                    ))),
            child: GridTile(
              footer: Container(
                  color: Colors.white70,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      new Text(
                        "\₹${productPrice}",
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )),
              child: Image.asset(
                productPic,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
