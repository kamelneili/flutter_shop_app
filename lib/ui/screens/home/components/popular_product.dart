import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technoshop/logic/blocs/product_bloc.dart';
import 'package:technoshop/logic/models/product.dart';
import 'package:technoshop/ui/screens/singleProduct/singleProduct_screen.dart';

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(DoFetchEvent1());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<ProductBloc, ProductStates>(
        builder: (context, state) {
          if (state is InitialState1) {
            return CircularProgressIndicator();
          } else if (state is LoadingState1) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FetchSuccess1) {
            return Products(state.products);
          }
        },
      ),
    );
  }

  Widget Products(List<Product> product_list) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              product_list[index],
              //['title'],
              //  product_list[index]
              //['featuredImage'],
              //   product_list[index]['oldPrice'],
              //  product_list[index]['price'],
            ),
          );
        });
  }

  // single_product
  Widget Single_prod(Product p) {
    return Card(
      child: Hero(
          tag: p.featuredImage,
          child: Material(
            child: InkWell(
              onTap: () {
                //Navigator.pushNamed(context, '/catalogue');
                // Navigator.pushNamed(context, '/h');
//Navigator.push(context, MaterialPageRoute(builder: (_) {return SingleProduct( p);  }));

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return SingleProduct(heroTag: p.featuredImage, product: p);
                   }));
              },
              // color: Colors.red,

              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      p.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      p.price,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      p.oldPrice,
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                ),
                child: SizedBox(
                  child: Image.network(
                    p.featuredImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
