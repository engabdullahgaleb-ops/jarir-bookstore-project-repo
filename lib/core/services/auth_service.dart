import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jarir_bookstore_project/core/models/user_model.dart';
import 'package:jarir_bookstore_project/core/repositories/firestore_repository.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await _googleSignIn.initialize();

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }


  Future<UserCredential> register(UserModel user) async {
    try {
      FirestoreRepository repository=FirestoreRepository();
      final credential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      await repository.registerNewUser({
        'fname': user.fname,
        'lname': user.lname,
        'email': user.email,
        'phone': user.phone,
        'createdAt': FieldValue.serverTimestamp(),
      },credential.user!.uid);

      return credential;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } catch (_) {
      throw 'unknown';
    }
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } catch (_) {
      throw 'unknown';
    }
  }

  Future<UserModel?> getCurrentUserData() async {

    final firebaseUser = _auth.currentUser;
    final FirestoreRepository repository = FirestoreRepository();;
    if (firebaseUser == null) {
      return null;
    }

    return await repository.getUserData(firebaseUser.uid);
  }
}
