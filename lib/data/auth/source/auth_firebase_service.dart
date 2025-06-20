import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_creation_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(
    UserCreationReq user,
  );
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
}
