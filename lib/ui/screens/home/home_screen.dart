import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technoshop/logic/blocs/Cart_bloc%20.dart';
import 'package:technoshop/logic/blocs/category_bloc%20.dart';
import 'package:technoshop/logic/blocs/product_bloc.dart';
import 'package:technoshop/ui/constants.dart';
import 'package:technoshop/ui/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  TabController _tabController;
  TextEditingController keyController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(DoFetchEvent1());
    BlocProvider.of<CategoryBloc>(context).add(CatDoFetchEvent1());
    BlocProvider.of<CartBloc>(context).add(DoFetchCartItemsEvent());

    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    setState(() {
      keyController.text = '';
    });
    _checkToken();
    super.initState();
  }

  bool isLoggedIn = false;
  SharedPreferences sharedPreferences;
  String token;
  _checkToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.get('token');
    // print(token);
    setState(() {
      if (token == null) {
        isLoggedIn = false;
      } else {
        isLoggedIn = true;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    keyController.dispose();
    //super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
     // drawer: NavigationDrawer(),
      body: Body(),
     // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
  
  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.red,//kPrimaryColor,
        elevation: 0,
        title: Center(
          /* decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),*/
          child: Row(
            children: [
              Text('Electro',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Text('Shop',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent)),
            ],
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: <Widget>[
              IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.yellow),
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context)
                        .add(DoFetchCartItemsEvent());

                    Navigator.pushNamed(context, '/card');
                  }),
              Positioned(
                top: 2.0,
                right: 12,
                child: Container(
                  child: Center(child: BlocBuilder<CartBloc, CartStates>(
                    builder: (context, state) {
                      if (!isLoggedIn) {
                        return Text("0");
                      } else {
                        if (state is CartLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is CartItemFetchSuccess) {
                          //widget.somme=state.cart.total;
                          if (state.cart == null)
                            return Text("0");
                          else
                            return Text(state.cart.cartItems.length.toString());
                        }
                      }
                    },
                  )),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  width: 18,
                  height: 14,
                ),
              )
            ]),
          ),
        ]);
  }
}
