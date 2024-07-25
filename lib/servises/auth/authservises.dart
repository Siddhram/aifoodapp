import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSurvice {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //current user
  User? getcurrentuser() {
    return firebaseAuth.currentUser;
  }

  //sin in
  Future<UserCredential> signinwithemailandpassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
           User? user = userCredential.user;
      if (user != null) {
        String? token = await user.getIdToken();
        print("is equal ---"+user.uid==user.getIdToken());
        await _saveToken(token);
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpwithemailandpassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
        // save token or uid
         User? user = userCredential.user;
      if (user != null) {
        String? token = await user.getIdToken();
                print("is equal ---" + user.uid == user.getIdToken());

        await _saveToken(token);
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signout() async {
    //remove token
      await firebaseAuth.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', '');
    
  }
   Future<void> _saveToken(String? token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null) {
      await prefs.setString('token', token);
    }else{
            await prefs.setString('token', '');

    }
  }
}
//hll3UStRtlQeMwXs6dmKHsklkmy1