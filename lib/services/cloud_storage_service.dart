// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';

// class CloudStorageService {
//   static CloudStorageService instance = CloudStorageService();

//   FirebaseStorage storage;
//   StorageReference storageReference;
// }


// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';

// class CloudStorageService {
//   static final CloudStorageService instance = CloudStorageService();

//   late final FirebaseStorage _storage; // Use `late` for lazy initialization
//   late final Reference storageReference;

//   String _profileImages = "profile_images";

//   CloudStorageService() {
//     _storage = FirebaseStorage.instance; // Initialize the FirebaseStorage instance
//     storageReference = _storage.ref().child(_profileImages); // Set the reference to the 'profile_images' folder
//   }


//   Future<String> uploadUserImage(File _image, String path, String uid) async {
//     try {
//       final Reference storageReference = _storage.ref().child(_profileImages).child(uid).putFile(_image).onComplete; // Use `Reference` instead of `StorageReference`
//       final UploadTask uploadTask = storageReference.putFile(file);
//       final TaskSnapshot taskSnapshot = await uploadTask;
//       final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print('Error uploading file: $e');
//       throw e;
//     }
//   }
// }



import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageService {
  static final CloudStorageService instance = CloudStorageService();

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final String _profileImages = "profile_images";

  Future<String> uploadUserImage(File image, String uid) async {
    try {
      // Create a reference to the target file path
      final Reference storageReference =
          _storage.ref().child(_profileImages).child(uid);

      // Start the upload task
      final UploadTask uploadTask = storageReference.putFile(image);

      // Wait for the task to complete and get the TaskSnapshot
      final TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL from the completed task
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading file: $e');
      throw e;
    }
  }
}

