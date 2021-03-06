import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_flutter/tiles/category_tile.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("products").getDocuments(), //obtendo as categorias do firebase
        builder: (context, snapshot) {
          if(!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator());
          else {

            var dividedTiles = ListTile.divideTiles(
                tiles: snapshot.data.documents.map((docs) {
                  return CategoryTile(docs);
                }).toList(),
              color: Colors.grey[500]).toList();

            return ListView(
              children: dividedTiles
            );
          }
        }
    );
  }
}

