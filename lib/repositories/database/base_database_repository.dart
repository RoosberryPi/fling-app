import 'package:flingapp/models/user_model.dart';

// connect to Cloud Firestore
abstract class BaseDatabaseRepository {
  void getUser(String userId); // retrieve user data from Firestore
  void getUsers(String userId, String gender);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<void> updateUserPictures(String imageName); // to add new picture data
}
