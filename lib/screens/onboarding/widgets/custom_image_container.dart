import 'package:flingapp/repositories/storage/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageContainer extends StatelessWidget {
  final String? imageUrl;

  const CustomImageContainer({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("image url is ${imageUrl}");

    return Padding(
        padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
        child: Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                    top: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                    left: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                    right: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1)),
                borderRadius: BorderRadius.circular(10)),
            child: (imageUrl == null || imageUrl?.length == 0)
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.add_circle, color: Colors.red),
                      onPressed: () async {
                        ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);

                        print("image picked ${image}");
                        if (image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('no image found')));
                        }

                        if (image != null) {
                          print("Uploading...");
                          StorageRepository().uploadImage(image);
                        }
                      },
                    ),
                  )
                : Image.network(imageUrl!, fit: BoxFit.cover)));
  }
}
