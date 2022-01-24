import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/models/message/message.dart';
import 'package:untitled/utils/values/collection_names.dart';

class MessagerService {
  CollectionReference get _dialogsCollectionPath =>
      FirebaseFirestore.instance.collection(dialogsCollectionName);

  Future<List<Message>> sendMessage(Message message) async {
    final DocumentReference dialogRef =
        _dialogsCollectionPath.doc(message.user);
    final json = (await dialogRef.get()).data();

    Map<String, dynamic> data = json == null ? {} :
        (await dialogRef.get()).data() as Map<String, dynamic>;
    final List<Message> messages = [];
    (data['messages'] as List).forEach((value) {
      messages.add(Message.fromJson(value));
    });

    dialogRef.set({'messages': (messages..add(message)).map((e) => e.toJson()).toList()});

    return messages;
    //
    // final messagesData = await _dialogsCollectionPath.doc(message.user).get();
    // if (messagesData.data() != null) {
    //   Map<String, dynamic> data = messagesData.data() as Map<String, dynamic>;
    //
    //   return (data['messager'] as List? ?? [])
    //       .map((e) => Message.fromJson(e))
    //       .toList();
    // } else {
    //   return [];
    // }
  }
}
