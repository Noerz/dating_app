import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeController extends GetxController {
  final AuthController _googleSignInController = Get.put(AuthController());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<User> user = <User>[].obs;
  @override
  void onInit() {
    super.onInit();
    getLike();
    ever(_googleSignInController.currentUser, (_) => getLike());
  }

  Future<void> getLike() async {
    final currentUser = _googleSignInController.currentUser.value;
    final CollectionReference users = _firestore.collection('users');
    final DocumentSnapshot documentSnapshot =
        await users.doc(currentUser!.uid).get();
    final nestedCollection = documentSnapshot.reference.collection('partner');
    final QuerySnapshot querySnapshot = await nestedCollection.get();

    try {
      user.value =
          querySnapshot.docs.map((doc) => User.fromSnapshot(doc)).toList();
    } catch (error) {
      // Handle error
      print('Failed to get users: $error');
    }
  }
}

class User {
  final String name;
  final int age;
  final String gender;
  final String imgUrl;

  User({
    required this.name,
    required this.age,
    required this.gender,
    required this.imgUrl,
  });

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return User(
      name: data['name'] ?? '',
      age: data['age'] ?? 0,
      gender: data['gender'] ?? '',
      imgUrl: data['imgUrl'] ?? '',
    );
  }
}
