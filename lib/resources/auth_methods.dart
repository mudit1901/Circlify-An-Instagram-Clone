import 'dart:typed_data';
import 'package:circlify/models/user.dart' as model;
import 'package:circlify/resources/storage_methods.dart';
import 'package:circlify/utils/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User? currentUser = _auth.currentUser;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser?.uid).get();

    return model.User.fromSnap(snap);
  }

  //SignUp User
  Future<void> signup({
    required String username,
    required String email,
    required String password,
    required Uint8List file,
  }) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          file.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          email: email,
          uid: cred.user!.uid,
          username: username,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );
      } else {
        Utils().toastmessage("Please fill in all the fields.");
      }
    } on FirebaseAuthException catch (error) {
      Utils().toastmessage(error.message ?? "An error occurred");
    } catch (e) {
      Utils().toastmessage(e.toString());
    }
  }

  //Logging in User
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // Fixed the condition here
        await _auth.signInWithEmailAndPassword(
            email: email, password: password); // Added await here
      } else {
        Utils().toastmessage("Please fill in all the fields.");
      }
    } on FirebaseAuthException catch (e) {
      Utils().toastmessage(e.toString());
    } catch (e) {
      Utils().toastmessage(e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
