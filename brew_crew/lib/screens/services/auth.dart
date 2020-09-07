import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  //final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anon
  Future signInAnon() async {
    try{

      // AuthResult result = await _auth.signInAnonymously();
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      User user = userCredential.user;
      //print(user);
      return user;

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password 

  // register with email & password 

  // sign out 

}