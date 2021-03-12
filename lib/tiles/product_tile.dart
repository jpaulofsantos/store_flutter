import 'package:flutter/material.dart';
import 'package:store_flutter/datas/product_data.dart';

class ProductTile extends StatelessWidget {

  final ProductData productData;
  final String type;

  ProductTile(this.type, this.productData);


  @override
  Widget build(BuildContext context) {
    return InkWell( //ao tocar cria uma pequena anição, é semelhante ao gesture detector
      child: Card(
        child: type == "grid" ? //se for Grid, insere uma coluna, se for list, insere uma linha
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //fornece uma imagem esticada
          mainAxisAlignment: MainAxisAlignment.start, //alinhando
          children: [
            AspectRatio( //razao entre largura e altura da imagem
                aspectRatio: 0.8,
              child: Image.network(productData.images[0],
                fit: BoxFit.cover, //imagem cobrindo o tamanho do aspectratio
              ),
            ),
            Expanded( //utiliza o espaço disponivel
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(productData.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text("R\$ ${productData.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        )
            : Row(
          children: [
            Flexible(
              flex: 1, //aplica uma divisão de espação da linha igualmente (50%)
                child: Image.network(productData.images[0],
                fit: BoxFit.cover,
                  height: 250.0,
                )
            ),
            Flexible(
              flex: 1, //aplica uma divisão de espação da linha igualmente (50%). Ex: caso seja 8 e o outro flex seja 2, este será 4x maior
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productData.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text("R\$ ${productData.price.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        )
      ),
    );
  }
}
