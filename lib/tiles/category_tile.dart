import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_flutter/screens/products_screen.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot); //recebe um documento

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(//icone da esquerda na pagina dos produtos
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.data["icon"]),
      ),
      title: Text(snapshot.data["title"]),
      trailing: Icon(Icons.keyboard_arrow_right), //icone à direita de cada produto
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> ProductScreen(snapshot))
        );
      },
    );
  }
}
