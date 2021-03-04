import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buidDrawerBack() => Container(//add degrade
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
          _buidDrawerBack()
        ],
      ),
    );
  }
}
