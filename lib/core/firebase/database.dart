import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<Map<String, dynamic>>> getData(String colName) async {
    try {
      List<Map<String, dynamic>> data = [];
      await _firestore.collection(colName).get().then(
        (value) {
          value.docs.map(
            (doc) {
              data.add(doc.data());
            },
          ).toList();
        },
      );

      return data;
    } catch (e) {
      return [];
    }
  }

  static Future<void> addItem({
    required String colName,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(colName).add(data);
  }
}
