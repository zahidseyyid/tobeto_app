import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBotMessageModel {
  String? prompt;
  String? response;

  ChatBotMessageModel({this.prompt, this.response});

  void updateResponse(String newResponse) {
    response = newResponse;
  }

  factory ChatBotMessageModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ChatBotMessageModel(
      prompt: data['prompt'],
      response: data['response'],
      //time: data['time'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'message': prompt,
      'isBot': response,
      //'time': time,
    };
  }
}
