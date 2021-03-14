import 'package:flutter/material.dart';
import 'package:store_flutter/screens/login_screen.dart';
import 'package:store_flutter/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController); //criando construtor para inserir o pagecontroller na home_screen

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(//add degrade
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 203, 236, 241),
            Colors.white
          ], begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );

    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView( //definindo a lista do drawer
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: [
              Container( // titulo + "olá usuário)
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack( //utilizado para facilitar no posicionamento dos textos
                  children: [
                    Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Text("Flutter's\nStore",
                          style: TextStyle(
                              fontSize: 34.0, fontWeight: FontWeight.bold),
                        ),
                    ),
                    Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Olá, ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold
                              ),
                            ),
                            GestureDetector(
                              child: Text("Entre ou cadastre-se",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0, fontWeight: FontWeight.bold
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => LoginScreen())
                                );
                              },
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Lojas", pageController, 2),
              DrawerTile(Icons.playlist_add_check, "Meus Pedidos", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
