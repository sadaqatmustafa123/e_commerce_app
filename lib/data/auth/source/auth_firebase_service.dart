import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/auth/models/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_creation_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(
    UserCreationReq user,
  );
  Future<Either> getAges();
  Future<Either> signIn(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(
    String email,
  );
  Future<bool> isLoggedIn();
  Future<void> signOut();
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signUp(UserCreationReq user) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(
            returnedData.user!.uid,
          )
          .set(
        {
          'firstName': user.firstName,
          'lastName': user.lastName,
          'email': user.email,
          'gender': user.gender,
          'age': user.age,
        },
      );
      return const Right("Sign up was successfull");
    } on FirebaseAuthException catch (e) {
      String message = "";
      {
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'An account already exists with the same email address.';
        }
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection("Ages").get();
      return Right(
        returnedData.docs,
      );
    } catch (e) {
      return const Left("Please try again.");
    }
  }

  @override
  Future<Either> signIn(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);

      return const Right("Sign in was successfull");
    } on FirebaseAuthException catch (e) {
      String message = "";
      {
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'An account already exists with the same email address.';
        }
      }
      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right("Password reset request sent");
    } catch (e) {
      return const Left("Password reset request not sent");
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser?.uid)
          .get();
      return Right(userData);
    } catch (e) {
      return const Left("Could not fetch user data.");
    }
  }
}
