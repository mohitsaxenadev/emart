import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productDetailsName;
  final productDetailsPrice;
  final productDetailsOldPrice;
  final productDetailsPic;

  ProductDetails(
      {this.productDetailsName,
      this.productDetailsOldPrice,
      this.productDetailsPic,
      this.productDetailsPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search), color: Colors.white, onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {})
        ],
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
                child: Container(
                  color: Colors.white54,
                  child: Image.asset(widget.productDetailsPic),
                ),
                footer: new Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: new Text(
                        widget.productDetailsName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      title: new Row(
                        children: <Widget>[
                          Expanded(
                              child:
                                  new Text("\₹${widget.productDetailsOldPrice}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ))),
                          Expanded(
                              child: new Text(
                            "\₹${widget.productDetailsPrice}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.pink,
                            ),
                          )),
                        ],
                      ),
                    ))),
          ),

          //the first buttons start here =========================
          Row(
            children: <Widget>[
              //size button ======================================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Size"),
                            content: new Text("Choose size"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Size")),
                      Expanded(child: new Icon((Icons.arrow_drop_down))),
                    ],
                  ),
                ),
              ),

//
//                  //color button ======================================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("Choose color"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Color")),
                      Expanded(child: new Icon((Icons.arrow_drop_down))),
                    ],
                  ),
                ),
              ),

              //quantity button ======================================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("Choose quantity"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Quantity")),
                      Expanded(child: new Icon((Icons.arrow_drop_down))),
                    ],
                  ),
                ),
              ),
            ],
          ),
//
//              //the second buttons start here =========================
          Row(
            children: <Widget>[
              //buy now button ======================================
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.pink,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Buy now"),
                ),
              ),
              new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.pink,
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.pink,
                  onPressed: () {}),
            ],
          ),
          Divider(color: Colors.pink),
          new ListTile(
            title: new Text(
              "Details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: new Text(
                "\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Divider(color: Colors.pink),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Text(widget.productDetailsName),
              )
            ],
          ),
//
//              //TODO brand==============================
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Brand",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Text("X"),
              )
            ],
          ),
//
//              //TODO condition of product=================
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Text("New/Old"),
              )
            ],
          ),
          Divider(
            color: Colors.pink,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              "People also bought",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(height: 360.0, child: SimilarProducts()),
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
          return SimilarSingleProd(
              productName: productList[index]['name'],
              productPic: productList[index]['picture'],
              productOldPrice: productList[index]['old_price'],
              productPrice: productList[index]['price']);
        });
  }
}

class SimilarSingleProd extends StatelessWidget {
  final productName;
  final productPic;
  final productOldPrice;
  final productPrice;

  SimilarSingleProd(
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
