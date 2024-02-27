import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/chat_bot_model.dart';
import 'package:flutter_application_1/models/discussion_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DiscussionModel>> getDiscussionModels(String uid) async {
    QuerySnapshot snapshot = await _firestore
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .get();

    List<DiscussionModel> discussions = snapshot.docs.map((doc) {
      return DiscussionModel.fromFirestore(doc);
    }).toList();

    return discussions;
  }

  Future<List<ChatBotMessageModel>> getMessages(
      String uid, String discussionId) async {
    QuerySnapshot snapshot = await _firestore
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .doc(discussionId)
        .collection('messages')
        .orderBy('createTime', descending: true)
        .get();

    List<ChatBotMessageModel> messages = snapshot.docs.map((doc) {
      return ChatBotMessageModel.fromFirestore(doc);
    }).toList();

    return messages;
  }

  Future<void> sendFirstMessage(String uid, String message) async {
    // Yeni bir discussion ID oluştur
    String discussionId = _firestore
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .doc()
        .id;

    // Yeni bir message ID oluştur
    String messageId = _firestore
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .doc(discussionId)
        .collection('messages')
        .doc()
        .id;

    // İlk mesajı gönder
    await _firestore
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .doc(discussionId)
        .collection('messages')
        .doc(messageId)
        .set({'prompt': message});

    // Discussion belgesine başlangıç zamanını, discussion ID'sini ve ilk mesaj ID'sini ekle
    await _firestore
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .doc(discussionId)
        .set({
      'startTime': DateTime.now(),
      'firstMessageId': messageId, // İlk mesajın ID'sini kaydet
      // Discussion ID'sini de kaydet
      'discussionId': discussionId,
    });
  }

  Future<String> sendMessage(
      String uid, String discussionId, String message) async {
    String messageId = _firestore
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .doc(discussionId)
        .collection('messages')
        .doc()
        .id;

    await _firestore
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .doc(discussionId)
        .collection('messages')
        .doc(messageId)
        .set({'prompt': message});

    return messageId;
  }

  Future<String> listenToSpecificDocument(
      String uid, String discussionId, String messageId) async {
    Completer<String> completer = Completer();

    StreamSubscription<DocumentSnapshot>? subscription;

    subscription = _firestore
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .doc(discussionId)
        .collection('messages')
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
}
