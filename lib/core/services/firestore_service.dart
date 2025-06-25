import 'package:fruit_app/core/services/database_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      final response = await firestore.collection(path).doc(documentId).get();
      if (!response.exists) {
        return;
      }
      return response.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['where'] != null) {
          for (var condition in query['where']) {
            data = data.where(
              condition['field'],
              isEqualTo: condition['isEqualTo'],
            );
          }
        }
        if (query['orderBy'] != null && query['order'] != null) {
          var orderBy = query['orderBy'];
          var order = query['order'];
          data = data.orderBy(orderBy, descending: order == 'desc');
        }
        if (query['limit'] != null) {
          data = data.limit(query['limit']);
        }
      }
      var response = await data.get();
      return response.docs.map((e) => e.data()).toList();
    }
  }
}
