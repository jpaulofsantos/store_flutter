import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              validator: (text) {
                if(text.isEmpty) return "Nome inválido!";
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Nome Completo"
              ),
            ),
            SizedBox(height: 16.0),
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
            SizedBox(height: 16.0),
            TextFormField(
              validator: (text) {
                if(text.isEmpty) return "Endereço Inválido!";
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Endereço"
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
                child: Text("Criar Conta",
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
