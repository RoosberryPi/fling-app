// import 'package:cloud_firestore/cloud_firestore.dart';

// import '/repositories/repositories.dart';
import '/models/models.dart';

class DatabaseRepository {
  // final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void getUser(String userId) {
    print('Getting user images from DB');
    // return _firebaseFirestore
    //     .collection('users')
    //     .doc(userId)
    //     .snapshots()
    //     .map((snap) => User.fromSnapshot(snap));
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
  Future<void> updateUserPictures(User user, String imageName) async {
    String downloadUrl = 'test';
    print(downloadUrl);
    // await StorageRepository().getDownloadURL(user, imageName);

    //return _firebaseFirestore.collection('users').doc(user.id).update({
    //  'imageUrls': FieldValue.arrayUnion([downloadUrl])
    //});
  }
}
