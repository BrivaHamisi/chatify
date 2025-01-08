// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// class MediaService {
//   static MediaService instance = MediaService();

//   Future<File?> getImageFromLibrary() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image == null) return null;
//     return File(image.path);
//   }
// }



// import 'dart:io';

// import 'package:image_picker/image_picker.dart';

// class MediaService {
//   static MediaService instance = MediaService();

//   Future<File> getImageFromLibrary() {
//     return ImagePicker.pickImage(source: ImageSource.gallery);
//   }
// }


import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MediaService {
  static MediaService instance = MediaService();

  Future<File?> getImageFromLibrary() async {
    final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      return File(xFile.path); // Convert XFile to File
    }
    return null; // Return null if no file was selected
  }
}
