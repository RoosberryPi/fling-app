import 'package:flingapp/models/user_model.dart';

abstract class BaseDatabaseRepository {
  void getUser(String userId);
  void getUsers(String userId, String gender);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<void> updateUserPictures(User user, String imageName);
}
