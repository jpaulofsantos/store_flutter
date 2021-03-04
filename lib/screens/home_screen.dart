import 'package:flutter/material.dart';
import 'package:store_flutter/tabs/home_tab.dart';
import 'package:store_flutter/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController(); //criando o controller das paginas

  @override
  Widget build(BuildContext context) {
    return PageView( // add page view, que pode alterar as páginas arrastando de um lado para o outro
      controller: _pageController, //add controler
      physics: NeverScrollableScrollPhysics(), //desabilitando a opção de arrastar entre as telas
      children: [
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(),
        )
      ],
    );
  }
}

