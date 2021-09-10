import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technoshop/logic/blocs/product_bloc.dart';
import 'package:technoshop/logic/models/product.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({this.product});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<int> ids = [];
  int position = 1;

  var description = Container(
      child: Text(
        "A style icon gets some love from one of today's top "
        "trendsetters. Pharrell Williams puts his creative spin on these "
        "shoes, which have all the clean, classicdetails of the beloved Stan Smith.",
        textAlign: TextAlign.justify,
        style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
      ),
      padding: EdgeInsets.all(16));

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: kPrimaryColor,

        body:
            BlocBuilder<ProductBloc, ProductStates>(builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // padding:
              //    EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: <Widget>[
                  hero(widget.product),
                  Property(widget.product),
                ],
              ),
            ),

            //
            Description(widget.product)

            //
          ],
        ),
      );
    })

        //
        //
        );

    //
  }

//
  Widget Description(Product p) {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      // padding: EdgeInsets.symmetric(
      //   horizontal: kDefaultPadding * 1.5,
      //   vertical: kDefaultPadding / 2,
      // ),
      child: Text(
        widget.product.content,
        style: TextStyle(color: Colors.black, fontSize: 19.0),
      ),
    );
  }

  Widget appBar() {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //Image.asset("images/p4.jpg"),
          //Container(),
          Image.asset(
            "images/bag_button.png",
            width: 27,
            height: 30,
          ),
        ],
      ),
    );
  }

  //
  Widget hero(Product product) {
    return Container(
      child: Stack(
        children: <Widget>[
          Hero(
            tag: widget.product.featuredImage,
//widget.heroTag,
            child: Image.network(
              widget.product.featuredImage,
              fit: BoxFit.cover,
              height: 300,
            ),
          ), //This
          // should be a paged
          // view.

          Positioned(
            width: 40,
            child: FloatingActionButton(
                heroTag: "btn2",
                elevation: 2,
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    if (ids.contains(position)) {
                      ids.remove(position);
                    } else {
                      ids.add(position);
                    }
                    setState(() {});
                  },
                  color: (ids.contains(position))
                      ? Colors.redAccent
                      : Colors.grey.shade400,
                ),
                backgroundColor: Colors.white,
                onPressed: () {}),
            bottom: 0,
            right: 80,
          ),
//********************** */
          Positioned(
            width: 40,
            child: FloatingActionButton(
              heroTag: "btn1",
              elevation: 2,
              child: Icon(Icons.add_shopping_cart),
              onPressed: () async {},
              backgroundColor: Colors.redAccent,
            ),
            bottom: 0,
            right: 20,
          ),
          ////////////
        ],
      ),
    );
  }

//
  Widget Property(Product product) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.product.title,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text("Price"),
              Row(
                children: [
                  Text(
                    product.price,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                  Text(
                    "DT",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
