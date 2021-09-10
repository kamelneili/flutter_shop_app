import 'package:flutter/material.dart';
import 'package:technoshop/ui/screens/catalogue/catalogue_screen.dart';
import 'package:technoshop/ui/screens/home/components/categories.dart';
import 'package:technoshop/ui/screens/home/components/popular_product.dart';
import 'package:technoshop/ui/screens/home/components/search_field.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(' Get electronics from home '),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SearchField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              InkWell(
                child: Text(
                  "View all",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                onTap: () {
                    //Navigator.pushNamed(context, '/catalogue');
                    // Navigator.pushNamed(context, '/h');
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CatalogueScreen();
                    }));
                    //  Navigator.of(context).pushNamed('/catalogue');
                  },
                // color: Colors.red,
              )
            ],
          ),
          HorizontalList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Tech',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          PopularProducts(),
        ],
      ),
    );
  }
}
