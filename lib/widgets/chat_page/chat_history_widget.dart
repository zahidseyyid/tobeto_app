import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/chat_page/chat_textfield_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_chat_card.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circular_progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/user/user_bloc.dart';
import '../../logic/blocs/user/user_state.dart';
import '../../models/chat_bot_model.dart';
import '../../pages/chat_bot_message_page.dart';

class ChatHistoryWidget extends StatelessWidget {
  final List<ChatBotMessageModel>? chatMessages;
  final void Function()? onPressed;
  const ChatHistoryWidget({
    super.key,
    required TextEditingController messageController,
    required this.widget,
    this.chatMessages,
    required this.onPressed,
  }) : _messageController = messageController;

  final TextEditingController _messageController;
  final ChatBotMessagePage widget;

  @override
  Widget build(BuildContext context) {
    String photo;
    String name;
    final userState = context.watch<UserBloc>().state;
    if (userState is UserFetchedState) {
      photo = userState.user!.profilePictureUrl!;
      name = userState.user!.nameSurname;
    } else {
      photo = CustomCircleAvatarConstants.defaultPhotoUrl;
      name = ChatBotConstants.studentTitle;
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            color: Theme.of(context).colorScheme.background,
            child: chatMessages == null
                ? Container()
                : ListView.builder(
                    reverse: true,
                    itemCount: chatMessages!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ChatCard(
                            photo: photo == ""
                                ? CustomCircleAvatarConstants.defaultPhotoUrl
                                : photo,
                            message: chatMessages![index].prompt!,
                            name: name,
                          ),
                          chatMessages![index].response == null
                              ? const CustomCircularProgress()
                              : ChatCard(
                                  photo: CustomCircleAvatarConstants
                                      .defaultPhotoUrl,
                                  message: chatMessages![index].response!,
                                  name: ChatBotConstants.chatBotTitle,
                                ),
                        ],
                      );
                    },
                  ),
          ),
          const Divider(height: 1),
          ChatTextField(
              messageController: _messageController, onPressed: onPressed),
        ],
      ),
    );
  }
}
