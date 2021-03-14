import 'dart:ffi';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:store_flutter/datas/product_data.dart';

class ProductScreen extends StatefulWidget {

  final ProductData productData;


  ProductScreen(this.productData);

  @override
  _ProductScreenState createState() => _ProductScreenState(productData); //recebe o productData, passa para o State e joga para o construtor
}

class _ProductScreenState extends State<ProductScreen> {

  String size;

  final ProductData productData;
  _ProductScreenState(this.productData);


  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
        centerTitle: true,
      ),
      body: ListView( //habilita que o user role a pagina para cima/baixo
        children: [
          AspectRatio(
              aspectRatio: 0.9,
            child: Carousel(
              images: productData.images.map((url) => NetworkImage(url)).toList(), //pega o array de imagens, joga num map e retorna uma lista com cada imagem atraves da url
              dotSize: 4.0, //tamanho do "pontinho" que indica qual imagem está
              dotSpacing: 15.0, //espaçamento entre os "pontinhos"
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false, //não muda as imagens automaticamente
            ),
          ),
          Padding(
              padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(productData.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500
                ),
                  maxLines: 3, //ocupa no máximo 3 linhas
                ),
                Text("R\$ ${productData.price.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor
                ),
                ),
                SizedBox(height: 16.0), //aplicando espaço entre o preço e o próximo Text
                Text(
                  "Tamanho",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView( //criando as caixas de opção do tamanho
                    padding: EdgeInsets.symmetric(vertical: 4.0), //espaçamento na vertical entre o próximo campo
                    scrollDirection: Axis.horizontal, //definando que a grid séra na horizontal (se não setar esse valor, cria aut. como vertical
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, //apenas 1 linha com as opções
                      mainAxisSpacing: 8.0, //aplica somente o main, mais possui apenas uma linha, aplicando o espaço somente na horizontal
                      childAspectRatio: 0.5,
                    ),
                    children: productData.sizes.map(
                        (string) {
                          return GestureDetector( //função ao clicar
                            onTap: () {
                              setState(() {
                                size = string;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration( //criando o box contendo os tamanhos da roupa
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                border: Border.all(
                                  color: string == size ? primaryColor : Colors.grey[500], //aplicando a cor na borda
                                  width: 2.0
                                )
                              ),
                              width: 50.0,
                              alignment: Alignment.center, //alinhamento da string do tamanho
                              child: Text(string),
                            ),
                          );
                        }
                    ).toList()
                  ),
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    onPressed: size != null ? //diferente de nulo, aplica função ao botão
                    () {

                    } : null, // ao retornar null, o botão fica desabilitado
                    child: Text(
                      "Adicionar ao Carrinho",
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                    ),
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Descrição",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  productData.description,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          )
        ],
              ),
    );
  }
}

