import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/models/message/message.dart';
import 'package:untitled/utils/values/collection_names.dart';

class UserService {
  CollectionReference get _dialogsCollectionPath =>
      FirebaseFirestore.instance.collection(dialogsCollectionName);

  Future<List<Message>> login(String name) async {
    final messagesData = await _dialogsCollectionPath.doc(name).get();
    if (messagesData.data() != null) {
      Map<String, dynamic> data = messagesData.data() as Map<String, dynamic>;

      return (data['messages'] as List? ?? [])
          .map((e) => Message.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
