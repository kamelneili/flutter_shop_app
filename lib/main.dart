import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technoshop/logic/blocs/Auth_bloc.dart';
import 'package:technoshop/logic/blocs/Cart_bloc%20.dart';
import 'package:technoshop/logic/blocs/Order_bloc.dart';
import 'package:technoshop/logic/blocs/category_bloc%20.dart';
import 'package:technoshop/logic/blocs/product_bloc.dart';
import 'package:technoshop/logic/blocs/search_bloc.dart';
import 'package:technoshop/logic/repositories/auth_repository.dart';
import 'package:technoshop/logic/repositories/cart_api.dart';
import 'package:technoshop/logic/repositories/categories_api.dart';
import 'package:technoshop/logic/repositories/order_api.dart';
import 'package:technoshop/logic/repositories/products_api.dart';
import 'package:technoshop/logic/state/auth_state.dart';
import 'package:technoshop/ui/screens/catalogue/catalogue_screen.dart';
import 'package:technoshop/ui/screens/home/home_screen.dart';
import 'package:technoshop/ui/screens/singleProduct/singleProduct_screen.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Auth());

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                OrderBloc(OrderInitialState(), OrderAPI()),
          ),
          BlocProvider(
            create: (context) =>
                CategoryBloc(CatInitialState1(), CategoriesAPI()),
          ),
          BlocProvider(
            create: (context) =>
                CategoryBloc(CatProductsInitialState1(), CategoriesAPI()),
          ),
          BlocProvider(
            create: (context) => ProductBloc(InitialState1(), ProductsAPI()),
          ),
          BlocProvider(
            create: (context) =>
                SearchBloc(SearchInitialState1(), ProductsAPI()),
          ),
          BlocProvider(
              create: (context) =>
                  AuthBloc(LoginInitState(), AuthRepository())),
          BlocProvider(
            create: (context) => CartBloc(CartInitialState(), CartAPI()),
          ),
        ],
        child: MaterialApp(

            debugShowCheckedModeBanner: false,
             theme: ThemeData(
       // textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
       // primaryColor: kPrimaryColor,
       // accentColor: kPrimaryColor,
      ),
            initialRoute: '/home',
            routes: {
                 //             '/orderDetails': (context) => OrderDetails(),

              //  '/order': (context) => Orders(),
             // '/card': (context) => CartItems(),
             // '/profile': (context) => Profile(),
             // '/products': (context) => Products(),
              '/singleproduct': (context) => SingleProduct(),
              '/catalogue': (context) => CatalogueScreen(),
              '/home': (context) => HomeScreen(),
            //  '/': (context) => Login(),
            //  '/SearchProducts': (context) => SearchProducts(key),
            }));
  }
}
