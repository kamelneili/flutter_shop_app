import 'package:flutter/material.dart';
import 'package:technoshop/ui/screens/catalogue/components/body.dart';

class CatalogueScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        //  backgroundColor: Color(0xFF332F43),
              elevation: 0,

        centerTitle: true,
        title: Text('Catalogue'),
      ),
      body:Body()
      
    );
  }
}