import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      //save user if it doesn't already exist
      _firestore
          .collection("Users")
          .doc(userCredential.user!.uid)
          .set({'uid': userCredential.user!.uid, 'email': email});
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // save user info in separate doc
      _firestore
          .collection("Users")
          .doc(userCredential.user!.uid)
          .set({'uid': userCredential.user!.uid, 'email': email});
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return _auth.signOut();
  }

  // error
}
