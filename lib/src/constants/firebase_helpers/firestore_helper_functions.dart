import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:restaurantmanagement/src/auth/domain/user_model.dart';
import '../../features/restaurants/domain/entities/restaurant_model.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firebase_collections.dart';

// ignore_for_file: no_leading_underscores_for_local_identifiers

// ignore_for_file: prefer_final_fields

class FirebaseHelperFunctions {
  var _fireStore = FirebaseFirestore.instance;
  var _user = FirebaseAuth.instance.currentUser;
  final _firebaseStorage = FirebaseStorage.instance;

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

  Future<CollectionReference<Map<String, dynamic>>>
      restaurantCollectionHelper() async {
    var result = _fireStore.collection(CollectionNames.RESTAURANT_COLLECTION);
    return result;
  }

  Future<void> orderCollectionHelper() async {}
  Future<void> productCollectionHelper() async {}

  //Document Reference
  Future<DocumentSnapshot<Map<String, dynamic>>> userDoc() async {
    var userCollection = await userCollectionHelper();
    return userCollection.doc(_user!.uid).get();
  }

  Future<bool> updateUserDoc(Map<String, dynamic> data) async {
    var userCollection = await userCollectionHelper();
    try {
      userCollection.doc(_user!.uid).update(data);
      return true;
    } catch (e) {
      Klog.logMessage("Error Updating User Doc:  $e");
      return false;
    }
  }

//Doc Helpers
  Future<RestaurantsModel> getUsersRestaurant(
      {required String restaurantId}) async {
    Klog.logMessage("Getting Restaurant");
    Klog.logMessage("Getting Restaurant: $restaurantId");
    var _restaurantCollection = await restaurantCollectionHelper();

    try {
      var result = await _restaurantCollection
          .doc(restaurantId)
          .get()
          .then((value) => RestaurantsModel.fromMap(value.data()!));
      Klog.logMap(result.toMap());
      return result;
    } catch (e) {
      Klog.logMessage("Error Getting Restaurant: $e");
      return RestaurantsModel.empty();
    }
  }

//Upload_Helper

  Future<String> uploadRestuarantImageHelper(File image, String path) async {
    try {
      var snapshot =
          await _firebaseStorage.ref().child('Restaurant/$path').putFile(image);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      Klog.logMessage("Restaurant Image Uploaded. URL: $downloadUrl");
      return downloadUrl;
    } catch (e) {
      Klog.logMap(ShowError(title: "Upload Failed", statusCode: 500).toMap());
      throw Exception('Upload Failed');
    }
  }
}
