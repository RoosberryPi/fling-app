import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../database/database_repository.dart';
import 'base_storage_repository.dart';

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(XFile image) async {
    print("uploading..");
    try {
      await storage
          .ref('user_1/${image.name}')
          .putFile(
            File(image.path),
          )
          .then(
            (p0) => DatabaseRepository().updateUserPictures(
              image.name,
            ),
          );
      print("succeeded!");
    } catch (err) {
      print("error uploading image ${err}");
    }
  }

  @override
  Future<String> getDownloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('${'user_1'}/$imageName').getDownloadURL();
    return downloadURL;
  }
}
