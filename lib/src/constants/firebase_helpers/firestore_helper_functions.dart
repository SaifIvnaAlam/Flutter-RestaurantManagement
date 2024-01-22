import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurantmanagement/src/auth/domain/user_model.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firebase_collections.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
// ignore_for_file: no_leading_underscores_for_local_identifiers

// ignore_for_file: prefer_final_fields

class FirebaseHelperFunctions {
  var _fireStore = FirebaseFirestore.instance;
  var _user = FirebaseAuth.instance.currentUser;

//Auth Helper
  Future<bool> isUserExists() async {
    if (_user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel> getCurrenUser() async {
    bool _doesUserExists = await isUserExists();
    if (_doesUserExists) {
      var _userResult = await _fireStore
          .collection(CollectionNames.USER_COLLECTION)
          .doc(_user!.uid)
          .get();
      return UserModel.fromMap(_userResult.data()!);
    } else {
      Klog.logMap(ShowError(title: "User Not Found", statusCode: 404).toMap());
      throw Exception('User not found');
    }
  }

//Collection Helpers
  Future<CollectionReference<Map<String, dynamic>>>
      userCollectionHelper() async {
    var result = _fireStore.collection(CollectionNames.USER_COLLECTION);
    return result;
  }

  Future<void> orderCollectionHelper() async {}
  Future<void> productCollectionHelper() async {}
  Future<void> imageUploadHelper() async {}

  //Document Reference
  Future<DocumentSnapshot<Map<String, dynamic>>> userDoc() async {
    var userCollection = await userCollectionHelper();
    return userCollection.doc(_user!.uid).get();
  }
}
