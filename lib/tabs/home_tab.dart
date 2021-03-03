import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buidBodyBack() => Container( //add degrade
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
    );

    return Stack(
      children: [
        _buidBodyBack(),
        CustomScrollView( //add scroll view sobre o _bodyBack
          slivers: [
            SliverAppBar(
              floating: true, //flutuando
              snap: true, //faz a barra sumir e voltar de acordo com a rolagem da página
            )
          ],
        )
      ],
    );
  }
}
