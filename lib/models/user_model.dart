import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userDataMap = Map();
  bool isLoading = false;


  @override
  void addListener(VoidCallback listener)  { //ao abrir o app, chamar a função
    super.addListener(listener);
    _loadCurrentUser();
  }

  void signUp({@required Map<String, dynamic> userDataMap, @required String pass,
    @required VoidCallback onSucess, @required VoidCallback onFail})  { //coloca {} para não precisar inserir os parâmetros em ordem, e coloca @required para não faltar nenhum parâmetro

    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(email: userDataMap["email"], 
        password: pass).then((user) async {
      firebaseUser = user;
      await _saveUserData(userDataMap);
      onSucess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  Future<Null> _saveUserData(Map<String, dynamic> userDataMap) async { //salvar usuarios na coleção users
    this.userDataMap = userDataMap;
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userDataMap);
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  void signIn({@required String email, @required String password,
    @required VoidCallback onSucess, @required VoidCallback onFail}) {

    isLoading = true;
    notifyListeners();

    _auth.signInWithEmailAndPassword(email: email, password: password).then((user) async {
      firebaseUser = user;
      await _loadCurrentUser();

      onSucess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });

  }

  void signOut() async{
    await _auth.signOut();
    userDataMap = Map();
    firebaseUser = null;
    notifyListeners();
  }

  Future<Null> _loadCurrentUser() async {
    if(firebaseUser == null)
      firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      if(userDataMap["name"] == null) {
        DocumentSnapshot docUser = await Firestore.instance.collection("users").document(firebaseUser.uid).get();
        userDataMap = docUser.data;
      }
    }
    notifyListeners();
  }

}