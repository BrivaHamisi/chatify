// import 'package:cloud_firestore/cloud_firestore.dart';

// class DBService {
//   static DBService instance = DBService();

//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   DBService();

//   Future<void> createUserInDB(
//       String _uid, String _name, String _email, String _imageUrl) async {
//     try {
//       return await _db.collection('Users').doc(_uid).set({
//         'name': _name,
//         'email': _email,
//         // 'password': _password,
//         'image': _imageUrl,
//         'lastSeen': DateTime.now().toUtc(),
//       });
//     } catch (e) {
//       print('Error creating user in DB: $e');
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  static final DBService instance = DBService._();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Private constructor for singleton pattern
  DBService._();

  Future<bool> createUserInDB(
      String uid, String name, String email, String imageUrl) async {
    try {
      // Validate inputs
      if (uid.isEmpty || name.isEmpty || email.isEmpty) {
        print('Error: Required fields cannot be empty');
        return false;
      }

      // Create user data map
      final userData = {
        'name': name,
        'email': email,
        'image': imageUrl,
        'lastSeen': FieldValue.serverTimestamp(), // Use server timestamp
        'createdAt': FieldValue.serverTimestamp(),
      };

      // Attempt to write to Firestore
      await _db.collection('Users').doc(uid).set(userData);
      
      // Verify the write
      final docSnapshot = await _db.collection('Users').doc(uid).get();
      if (docSnapshot.exists) {
        print('Successfully created user document for uid: $uid');
        return true;
      } else {
        print('Failed to verify user document creation for uid: $uid');
        return false;
      }
    } catch (e, stackTrace) {
      print('Error creating user in DB: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }
}