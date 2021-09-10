import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technoshop/logic/blocs/Cart_bloc%20.dart';
import 'package:technoshop/logic/blocs/category_bloc%20.dart';
import 'package:technoshop/logic/blocs/product_bloc.dart';
import 'package:technoshop/logic/models/category.dart';

class HorizontalList extends StatefulWidget {
  

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList
> {
   @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(DoFetchEvent1());
    BlocProvider.of<CategoryBloc>(context).add(CatDoFetchEvent1());
    BlocProvider.of<CartBloc>(context).add(DoFetchCartItemsEvent());

    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: BlocBuilder<CategoryBloc, CategoryStates>(
          builder: (context, state) {
            if (state is CatLoadingState1) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CatFetchSuccess1) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return Cat(state.categories[index]);
                },
              );
            } else {
              return Container();
            }
          },
        ));
  

  }

    Widget Cat(Category category)
    {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/catalogue');
          // Navigator.pushNamed(context, '/h');
//Navigator.push(context, MaterialPageRoute(builder: (_) {return SingleProduct( p);  }));
         
          BlocProvider.of<CategoryBloc>(context)
              .add(CatDoFetchProductsEvent1(category: category));
        },
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.network(
                //image_location,
                // "assets/images/p1.jpg",
                category.image,
                width: 50.0,
                height: 50.0,
              ),
              //

              //
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  category.title,
                  //image_caption,
                  style:TextStyle(fontSize: 12.0),
                ),
              )),
        ),
      ),
    );
    }
  

}