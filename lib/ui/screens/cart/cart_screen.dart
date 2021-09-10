import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technoshop/logic/blocs/Cart_bloc%20.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          BlocBuilder<CartBloc, CartStates>(
            builder: (context, state) {
              if (state is CartLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CartItemFetchSuccess) {
              return Text(
               state.cart.cartItems.length.toString(),
                style: Theme.of(context).textTheme.caption,
              );
          }
            },
          ),
        ],
      ),
    );
  }
}
