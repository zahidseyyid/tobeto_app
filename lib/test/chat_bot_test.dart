import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circular_progress.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final String uid;
  final String discussionId;

  const ChatScreen({super.key, required this.uid, required this.discussionId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chatbot')
            .doc(widget.uid)
            .collection('discussions')
            .doc(widget.discussionId)
            .collection('messages')
            .orderBy('createTime',
                descending: true) // timestamp alanına göre sırala
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CustomCircularProgress());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Bir hata oluştu'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Veri bulunamadı'));
          }

          List<String> messageIds =
              snapshot.data!.docs.map((doc) => doc.id).toList();

          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                color: Colors.grey[200],
                child: ListView.builder(
                  reverse: true,
                  itemCount: messageIds.length,
                  itemBuilder: (context, index) {
                    String messageId = messageIds[index];
                    return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('chatbot')
                          .doc(widget.uid)
                          .collection('discussions')
                          .doc(widget.discussionId)
                          .collection('messages')
                          .doc(messageId)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {}
                        if (snapshot.hasError) {
                          return Text('Bir hata oluştu: ${snapshot.error}');
                        }
                        if (!snapshot.hasData) {
                          return const Text('Veri bulunamadı');
                        }

                        var messageData =
                            snapshot.data!.data() as Map<String, dynamic>;
                        Timestamp firestoreTimestamp =
                            Timestamp.fromMillisecondsSinceEpoch(1645885200000);

                        // Timestamp'u DateTime nesnesine dönüştür
                        DateTime dateTime = firestoreTimestamp.toDate();
                        var dateFormat =
                            DateFormat('dd.MM.yyyy HH:mm', 'tr_TR');
                        // DateTime nesnesini stringe dönüştür
                        String timestampString = dateFormat.format(dateTime);
                        return Column(
                          children: [
                            // ListTile(
                            //   title: Text(messageData['prompt']),
                            //   subtitle: Text(messageData['response']),
                            // ),
                            ChatCard(
                              message: messageData['prompt'],
                              name: "Öğrenci",
                              time: timestampString,
                            ),
                            messageData['response'] == null
                                ? const CustomCircularProgress()
                                : ChatCard(
                                    name: "TobetoAI",
                                    message: messageData['response'],
                                    time: timestampString,
                                  ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              const Divider(height: 1),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: paddingAllMedium,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            hintText: 'Mesajınızı yazın',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          _sendMessage(_messageController, widget.uid,
                              widget.discussionId);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

void _sendMessage(
    TextEditingController messageController, String uid, String discussionId) {
  if (messageController.text.isNotEmpty) {
    String messageId = FirebaseFirestore.instance
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .doc(discussionId)
        .collection('messages')
        .doc()
        .id; // Yeni bir benzersiz ID oluştur

    FirebaseFirestore.instance
        .collection('chatbot')
        .doc(uid)
        .collection('discussions')
        .doc(discussionId)
        .collection('messages')
        .doc(messageId)
        .set({
      'prompt': messageController.text,
    });
    messageController.clear();
  }
}

class ChatCard extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  const ChatCard(
      {super.key,
      required this.name,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          name == "TobetoAI" ? Alignment.centerLeft : Alignment.centerRight,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: paddingAllMedium,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Image(
                            image: NetworkImage(
                                CustpmCircleAvatarConstants.defaultPhotoUrl),
                            width: 30,
                            height: 30),
                        Text(name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        message,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: name == "TobetoAI"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Text(time)),
          ],
        ),
      ),
    );
  }
}
