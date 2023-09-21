import 'package:image_picker/image_picker.dart';

abstract class BaseStorageRepository {
  // An abstract class cannot be instantiated but they can be sub-classed.
  // It ensures that all implementation subclasses define all the properties and methods that abstract class defines, but leaves the implementation to each subclass.
  Future<void> uploadImage(XFile image);
  Future<String> getDownloadURL(String imageName);
}
