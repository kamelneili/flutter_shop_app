import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technoshop/logic/blocs/category_bloc%20.dart';
import 'package:technoshop/logic/models/category.dart';
import 'package:technoshop/ui/screens/category_products/body.dart';

class CategoryProducts extends StatefulWidget {
  final Category category;
  //final Post post;
  CategoryProducts(this.category);
  @override
  CategoryProductsState createState() => CategoryProductsState();
}

class CategoryProductsState extends State<CategoryProducts> {
  //PostsAPI postsAPI = PostsAPI();

  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context)
        .add(CatDoFetchProductsEvent1(category: widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: kBackgroundColor,

      appBar: AppBar(
        //    backgroundColor: kPrimaryColor,

        centerTitle: true,
        title: Text(widget.category.title),
      ),

      body: Body(category: widget.category),
    );
    //

    //
  }
}
