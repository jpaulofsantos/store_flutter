import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_flutter/datas/product_data.dart';
import 'package:store_flutter/tiles/product_tile.dart';

class ProductScreen extends StatelessWidget {

  final DocumentSnapshot snapshot; //documentsnap refere-se a uma fotografia de apenas um documento

  ProductScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( //tab superior que muda de grid para lista
        length: 2, //qtde de tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data["title"]),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white, //cor da tab selecionada
              tabs: [
                Tab(icon: Icon(Icons.grid_on),),
                Tab(icon: Icon(Icons.list),)
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>( //querysnap refere-se a uma "fotografia" de uma coleção
            future: Firestore.instance.collection("products").document(snapshot.documentID)
                .collection("items").getDocuments(), //acessando a coleção produtos / items
            builder: (context, snapshot) {
              if(!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator());
                else
                  return TabBarView(
                    physics: NeverScrollableScrollPhysics(), //bloqueando trocar entre as views por gesto de arrastar
                    children: [
                      GridView.builder( //criando a grid
                        padding: EdgeInsets.all(4.0),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                            childAspectRatio: 0.65, //razao entre largura e altura
                          ),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return ProductTile("grid", ProductData.fromDocument(snapshot.data.documents[index]));
                          }
                      ),
                      ListView.builder( //criando a listview
                        padding: EdgeInsets.all(4.0),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            return ProductTile("list", ProductData.fromDocument(snapshot.data.documents[index]));
                          }
                      ),
                    ],
                  );
            },
          ),
        )
    );
  }
}
