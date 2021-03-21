import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:store_flutter/models/user_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _adressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Criar Conta"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>( //verificando ação isloading de usermodel
          builder: (context, chuil, model) {
            if(model.isLoading)
              return Center(child: CircularProgressIndicator());
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  TextFormField(
                    controller: _nameController,
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
                    controller: _emailController,
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
                    controller: _passController,
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
                    controller: _adressController,
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

                          Map<String, dynamic> userDataMap = { //salvando dados no map - a senha sera salva no firebase
                            "name": _nameController.text.trim(),
                            "email": _emailController.text.trim(),
                            "adress": _adressController.text.trim()
                          };

                          model.signUp(
                              userDataMap: userDataMap,
                              pass: _passController.text,
                              onSucess: _onSucess,
                              onFail: _onFail
                          );
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
            );
          },

        )
    );
  }

  void _onSucess() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
          content: Text("Usuário criado com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),)
    );
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.of(context).pop()); //saindo da tela de criação do usuário
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Erro ao cadastrar usuário!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),)
    );
  }
}