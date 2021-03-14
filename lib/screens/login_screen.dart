import 'package:flutter/material.dart';
import 'package:store_flutter/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen())
                );
              },
              child: Text("CRIAR CONTA",
              style: TextStyle(
                fontSize: 15.0
              ),
              ),
            textColor: Colors.white,
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              validator: (text) {
                if(text.isEmpty || !text.contains("@")) return "E-mail inválido!";
                return null;
              },
              decoration: InputDecoration(
                hintText: "E-mail"
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              validator: (text) {
                if(text.isEmpty || text.length < 6) return "Senha inválida!";
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Senha"
              ),
              obscureText: true, //campo senha
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {

                },
                child: Text("Esqueci a minha senha",
                textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(height: 16.0,),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                onPressed: () {
                  if(_formKey.currentState.validate()) {

                  }
                },
                child: Text("Entrar",
                  style: TextStyle(
                      fontSize: 18.0
                  ),

                ),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

