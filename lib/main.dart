import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:store_flutter/screens/home_screen.dart';
import 'package:store_flutter/screens/login_screen.dart';
import 'package:store_flutter/screens/signup_screen.dart';

import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>( // tudo que estiver abaixo do ScopedModel, será alterado, caso ocorra alteração no UserModel
      model: UserModel(),
      child: MaterialApp(
        title: 'Your Store',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color.fromARGB(255, 4, 125, 141)
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

