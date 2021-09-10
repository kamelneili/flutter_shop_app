import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technoshop/logic/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technoshop/ui/screens/home/home_screen.dart';
import 'package:technoshop/ui/screens/singleProduct/components/body.dart';

class SingleProduct extends StatefulWidget {
  final Product product;
  //final Post post;
  final heroTag;

  SingleProduct({this.heroTag, this.product});
  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  void initState() {
    //  BlocProvider.of<CartBloc>(context).add(DoFetchCartItemsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //   backgroundColor: kBackgroundColor,

        centerTitle: false,
//backgroundColor: Color(0xFF332F43),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return HomeScreen();
            }));
          },
        ),
      ),
      body: Body(product: widget.product),
    );

    
  }


}
