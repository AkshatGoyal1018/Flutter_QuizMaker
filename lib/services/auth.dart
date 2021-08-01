import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizmaker/Model/user.dart';

class AuthService {

  FirebaseAuth _auth = FirebaseAuth.instance;

  user _userFromFireBaseUser(User users) {
    return users != null ? user(uid: users.uid) : null;
  }

  Future signInEmailAndPass(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseuser = authResult.user;
      return _userFromFireBaseUser(firebaseuser);
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future signUpEmailAndPass(String email, String password) async {

    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseuser = authResult.user;
      return _userFromFireBaseUser(firebaseuser);
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}