import 'package:cloud_firestore/cloud_firestore.dart';

import '../storage/storage_repository.dart';
import '/models/models.dart';

class DatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser() {
    return _firebaseFirestore
        .collection('users')
        .doc('hEUgxildrSZECjj3uFm7')
        .snapshots()
        .map((snap) => User.fromSnapshot(
            snap)); // result of the snap will be mapped to a user object
  }

  @override
  void getUsers(
    String userId,
    String gender,
  ) {
    // return _firebaseFirestore
    //     .collection('users')
    //     .where('gender', isNotEqualTo: gender)
    //     .snapshots()
    //     .map((snap) {
    //   return snap.docs.map((doc) => User.fromSnapshot(doc)).toList();
    // });
  }

  @override
  Future<void> createUser(User user) async {
    //  await _firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }

  @override
  Future<void> updateUser(User user) async {
    // return _firebaseFirestore
    //     .collection('users')
    //     .doc(user.id)
    //     .update(user.toMap())
    //     .then(
    //       (value) => print('User document updated.'),
    //     );
  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    String downloadUrl = await StorageRepository().getDownloadURL(imageName);

    return _firebaseFirestore
        .collection('users')
        .doc('hEUgxildrSZECjj3uFm7')
        .update({
      'imageUrls': FieldValue.arrayUnion([downloadUrl])
    });
  }
}
