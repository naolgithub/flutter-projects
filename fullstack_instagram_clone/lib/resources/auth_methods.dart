import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fullstack_instagram_clone/models/user.dart' as model;

import 'storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromUser(snap);
  }

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

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );

        //add user to our database

        //THIS IS WITHOUT USING MODELS
        // await _firestore.collection('users').doc(cred.user!.uid).set({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': [],
        //   'photoUrl': photoUrl,
        // });

        //another way of storing user information and ignoring the uid
        // await _firestore.collection('users').add({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': [],
        // });

        //THIS IS WITH USING MODELS
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());

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

//logging in user method
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'success';
      } else {
        res = 'Please enter all the fields';
      }
    }

    //  //THE FOLLOWING FIREBASE EXCEPTIONS ARE OPTIONAL
    // on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     res = 'user-not-found';
    //   } else if (e.code  == 'wrong-password') {
    //     res = 'wrong-password';
    //   }
    // }

    catch (err) {
      res = err.toString();
    }
    return res;
  }
}
