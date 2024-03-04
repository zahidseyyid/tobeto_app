import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/constants/page_constants.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required TextEditingController messageController,
    required this.onPressed,
  }) : _messageController = messageController;

  final TextEditingController _messageController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: paddingAllMedium,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: ChatBotConstants.enterYourMessage,
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: ChatBotConstants.sendMessageIcon,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
  //TODO: Sunum sonrası refactor edilecek.
}
