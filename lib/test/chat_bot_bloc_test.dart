import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/logic/blocs/chat/chat_bloc.dart';
import 'package:flutter_application_1/logic/blocs/chat/chat_event.dart';
import 'package:flutter_application_1/logic/blocs/chat/chat_state.dart';
import 'package:flutter_application_1/test/chat_bot_test.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circular_progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotBlocTest extends StatefulWidget {
  final String? uid;
  final String? discussionId;
  const ChatBotBlocTest({
    super.key,
    required this.uid,
    required this.discussionId,
  });

  @override
  State<ChatBotBlocTest> createState() => _ChatBotBlocTestState();
}

class _ChatBotBlocTestState extends State<ChatBotBlocTest> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // initState içinde ChatResetEvent tetikleniyor
    context.read<ChatBloc>().add(ChatResetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bot Bloc Test'),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatInitialState) {
            context.read<ChatBloc>().add(ChatFetchEvent(
                uid: widget.uid!, discussionId: widget.discussionId!));
          } else if (state is ChatFetchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ChatFetchedState) {
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  color: Colors.grey[200],
                  child: ListView.builder(
                    reverse: true,
                    itemCount: state.chatMessages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ChatCard(
                            message: state.chatMessages[index].prompt!,
                            name: "Öğrenci",
                            time: "12:00",
                          ),
                          state.chatMessages[index].response == null
                              ? const CustomCircularProgress()
                              : ChatCard(
                                  message: state.chatMessages[index].response!,
                                  name: "TobetoAI",
                                  time: "12:01",
                                ),
                        ],
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
                            context.read<ChatBloc>().add(ChatAddMessageEvent(
                                message: _messageController.text,
                                uid: widget.uid!,
                                discussionId: widget.discussionId!));
                            context.read<ChatBloc>().add(ChatFetchResponseEvent(
                                  uid: widget.uid!,
                                  discussionId: widget.discussionId!,
                                  message: _messageController.text,
                                ));
                            _messageController.clear();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ChatFetchErrorState) {
            return Center(
              child: Center(child: Text(state.errorMessage)),
            );
          }
          return const Text("");
        },
      ),
    );
  }
}
