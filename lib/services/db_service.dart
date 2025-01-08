import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  static DBService instance = DBService();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DBService();

  Future<void> createUserInDB(
      String _uid, String _name, String _email, String _imageUrl) async {
    try {
      return await _db.collection('Users').doc(_uid).set({
        'name': _name,
        'email': _email,
        // 'password': _password,
        'image': _imageUrl,
        'lastSeen': DateTime.now().toUtc(),
      });
    } catch (e) {
      print('Error creating user in DB: $e');
    }
  }
}
