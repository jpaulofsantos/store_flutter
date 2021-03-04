import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buidBodyBack() => Container(//add degrade
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );

    return Stack(
      children: <Widget>[
        _buidBodyBack(),
        CustomScrollView(//add scroll view sobre o _bodyBack
          slivers: [
            SliverAppBar(
              floating: true, //flutuando
              snap: true, //faz a barra sumir e voltar de acordo com a rolagem da página
              backgroundColor: Colors.transparent, //cor abaixo da barra
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Novidades"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
                future: Firestore.instance.collection("home").orderBy("pos").getDocuments(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return SliverToBoxAdapter(//não é possivel retornar um CircularProgress direto, precisa ser um sliver, pois esta dentro de um sliverappbar
                      child: Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  else
                    return SliverStaggeredGrid.count(//usar o .count pois neste caso sabemos a quantidade de itens da grid
                      crossAxisCount: 2, //2 blocos de largura
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      staggeredTiles: snapshot.data.documents.map((doc) {//pegando a lista de documentos
                        return StaggeredTile.count(doc.data['x'], doc.data['y']); //pega as posições x e y e transforma num staggeredtile
                      }).toList(), //transforma o map numa lista
                      children: snapshot.data.documents.map((doc) {
                        return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: doc.data['image'],
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                    );
                })
          ],
        )
      ],
    );
  }
}
