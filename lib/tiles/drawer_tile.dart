import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  DrawerTile(this.icon, this.text, this.pageController, this.page);


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page); //passando a pagina recebida no construtor
        },
        child: Container(//especificar a altura de cada item
          height: 60.0,
          child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                color: pageController.page.round() == page ?  //validando e aplicando a cor baseado na pagina aberta - usando o round pois o page do controller é um double
                  Theme.of(context).primaryColor : Colors.grey[700]
              ),
              SizedBox( //aplicar o espaço entre o icone e o texto
                width: 32.0
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: pageController.page.round() == page ?  //validando e aplicando a cor baseado na pagina aberta - usando o round pois o page do controller é um double
                  Theme.of(context).primaryColor : Colors.grey[700]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
