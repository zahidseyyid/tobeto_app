import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/constants/collection_names.dart';
import 'package:flutter_application_1/models/chat_bot_model.dart';
import 'package:flutter_application_1/models/discussion_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DiscussionModel>> getDiscussionModels(String uid) async {
    QuerySnapshot snapshot = await _firestore
        .collection(Collections.CHATBOT)
        .doc(uid)
        .collection(Collections.DISCUSSIONS)
        .orderBy(Collections.STARTTIME, descending: true)
        .get();

    List<DiscussionModel> discussions = snapshot.docs.map((doc) {
      return DiscussionModel.fromFirestore(doc);
    }).toList();

    return discussions;
  }

  Future<List<ChatBotMessageModel>> getMessages(
      String uid, String discussionId) async {
    QuerySnapshot snapshot = await _firestore
        .collection(Collections.CHATBOT)
        .doc(uid)
        .collection(Collections.DISCUSSIONS)
        .doc(discussionId)
        .collection(Collections.MESSAGES)
        .orderBy(Collections.CREATETIME, descending: true)
        .get();

    List<ChatBotMessageModel> messages = snapshot.docs.map((doc) {
      return ChatBotMessageModel.fromFirestore(doc);
    }).toList();

    return messages;
  }

  Future<String> createDiscussion(String uid) async {
    String discussionID = _firestore
        .collection(Collections.CHATBOT)
        .doc(uid)
        .collection(Collections.DISCUSSIONS)
        .doc()
        .id;
    return discussionID;
  }

  Future<List<String>> sendMessage(
      String uid, String? discussionId, String message) async {
    bool isDiscussionExist = true;
    if (discussionId == null) {
      discussionId = await createDiscussion(uid);
      isDiscussionExist = false;
    }
    String messageId = _firestore
        .collection(Collections.CHATBOT)
        .doc(uid)
        .collection(Collections.DISCUSSIONS)
        .doc(discussionId)
        .collection(Collections.MESSAGES)
        .doc()
        .id;

    await _firestore
        .collection(Collections.CHATBOT)
        .doc(uid)
        .collection(Collections.DISCUSSIONS)
        .doc(discussionId)
        .collection(Collections.MESSAGES)
        .doc(messageId)
        .set({'prompt': message});

    if (!isDiscussionExist) {
      await _firestore
          .collection(Collections.CHATBOT)
          .doc(uid)
          .collection(Collections.DISCUSSIONS)
          .doc(discussionId)
          .set({
        'startTime': DateTime.now(),
        'firstMessage': message,
        'discussionId': discussionId,
      });
    }
    List<String> idList = [messageId, discussionId];
    return idList;
  }

  Future<String> listenToSpecificDocument(
      String uid, String discussionId, String messageId) async {
    Completer<String> completer = Completer();

    StreamSubscription<DocumentSnapshot>? subscription;

    subscription = _firestore
        .collection(Collections.CHATBOT)
        .doc(uid)
        .collection(Collections.DISCUSSIONS)
        .doc(discussionId)
        .collection(Collections.MESSAGES)
        .doc(messageId)
        .snapshots()
        .listen((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        final response =
            (snapshot.data() as Map<String, dynamic>)['response'] as String?;
        if (response != null) {
          completer.complete(response);
          subscription!.cancel(); // Dinlemeyi sonlandır
        }
      }
    });

    return completer.future;
  }

  Future<void> deleteDiscussion(String uid, String discussionId) async {
    await _firestore
        .collection(Collections.CHATBOT)
        .doc(uid)
        .collection(Collections.DISCUSSIONS)
        .doc(discussionId)
        .delete();

    await _firestore
        .collection(Collections.CHATBOT)
        .doc(uid)
        .collection(Collections.DISCUSSIONS)
        .doc(discussionId)
        .collection(Collections.MESSAGES)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
}
