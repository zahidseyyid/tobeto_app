// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/logic/blocs/chat/chat_bloc.dart';
import 'package:flutter_application_1/logic/blocs/chat/chat_event.dart';
import 'package:flutter_application_1/logic/blocs/chat/chat_state.dart';
import 'package:flutter_application_1/widgets/chat_page/chat_history_widget.dart';
import 'package:flutter_application_1/widgets/chat_page/chat_textfield_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circular_progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChatBotMessagePage extends StatefulWidget {
  final String uid;
  String? discussionId;
  ChatBotMessagePage({
    super.key,
    required this.uid,
    this.discussionId,
  });

  @override
  State<ChatBotMessagePage> createState() => _ChatBotMessagePageState();
}

class _ChatBotMessagePageState extends State<ChatBotMessagePage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // initState içinde ChatResetEvent tetikleniyor
    context.read<ChatBloc>().add(ChatResetEvent());
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    var logoAsset = getLogo(brightness);
    return Scaffold(
      appBar: AppBar(
          title: const Text('TobetoAI Sohbet'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context, true); // Geri dönüş değeri true olarak ayarlandı
            },
          )),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatInitialState) {
            print("ChatInitialState");
            if (widget.discussionId == null) {
              print("ChatInitialState - widget.discussionId == null");
              context.read<ChatBloc>().add(ChatEmptyDiscussionEvent());
            } else {
              print("ChatInitialState - widget.discussionId != null");
              context.read<ChatBloc>().add(ChatFetchEvent(
                  uid: widget.uid, discussionId: widget.discussionId!));
            }
          } else if (state is ChatFetchLoadingState) {
            print("ChatFetchLoadingState");
            return const Center(
              child: Center(child: CustomCircularProgress()),
            );
          } else if (state is ChatFetchedState) {
            print("ChatFetchedState");
            return ChatHistoryWidget(
              chatMessages: state.chatMessages,
              messageController: _messageController,
              widget: widget,
              onPressed: () {
                context.read<ChatBloc>().add(ChatAddMessageEvent(
                      message: _messageController.text,
                      uid: widget.uid,
                      discussionId: widget.discussionId,
                    ));
                context.read<ChatBloc>().add(ChatFetchResponseEvent(
                      uid: widget.uid,
                      message: _messageController.text,
                      discussionId: widget.discussionId,
                    ));
                _messageController.clear();
              },
            );
          } else if (state is ChatFetchErrorState) {
            print("ChatFetchErrorState");
            return Center(
              child: Center(child: Text(state.errorMessage)),
            );
          } else if (state is ChatEmptyDiscussion) {
            print("EmptyDiscussion");
            return SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Image(
                          image: AssetImage(logoAsset),
                          width: 200,
                        )),
                        const SizedBox(height: 20),
                        const Text("İlk mesajınızı yazın"),
                      ],
                    ),
                  ),
                  ChatTextField(
                      messageController: _messageController,
                      onPressed: () {
                        context
                            .read<ChatBloc>()
                            .add(ChatAddFirstMessageEvent());
                        context.read<ChatBloc>().add(ChatAddMessageEvent(
                              message: _messageController.text,
                              uid: widget.uid,
                            ));
                        context.read<ChatBloc>().add(ChatFetchResponseEvent(
                              uid: widget.uid,
                              message: _messageController.text,
                            ));
                        // TODO: Mesaj oluşturulduğunda widget.discussionId güncellenmeli

                        _messageController.clear();
                      }),
                ],
              ),
            );
          } else if (state is ChatFirstMessageAddedState) {}
          return Container();
        },
      ),
    );
  }
}
