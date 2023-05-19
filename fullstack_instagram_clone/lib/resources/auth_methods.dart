import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //sign up user method
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    // required Uint8List file,
    required File my_file,
  }) async {
    String res = "some error occurred";
    try {
      if (email.isEmpty ||
              password.isEmpty ||
              username.isNotEmpty ||
              bio.isNotEmpty
          // ||
          // file != null

          ) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        //user id
        print(cred.user!.uid);

        // String photoUrl = await StorageMethods()
        //     .uploadImageToStorage('profilePics', file, false);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', my_file, false);

        //add user to our database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });
        //another way of storing user information and ignoring the uid
        // await _firestore.collection('users').add({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': [],
        // });
        res = "success";
      }
    }
    // THE FOLLOWING FIREBASE EXCEPTIONS ARE OPTIONAL
    // on FirebaseAuthException catch (err) {
    //   if (err.code == 'invalid-email') {
    //     res = 'The email is badly formatted. ';
    //   } else if (err.code  == 'weak-password') {
    //     res = 'Password should be at least 6 characters';
    //   }
    // }

    catch (err) {
      res = err.toString();
    }
    return res;
  }
}
