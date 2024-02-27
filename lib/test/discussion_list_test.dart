import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/logic/blocs/discussion/discussion_bloc.dart';
import 'package:flutter_application_1/logic/blocs/discussion/discussion_event.dart';
import 'package:flutter_application_1/logic/blocs/discussion/discussion_state.dart';
import 'package:flutter_application_1/logic/repositories/chat_bot_repository.dart';
import 'package:flutter_application_1/test/chat_bot_bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscussionListTest extends StatefulWidget {
  const DiscussionListTest({super.key});

  @override
  State<DiscussionListTest> createState() => _DiscussionListTestState();
}

class _DiscussionListTestState extends State<DiscussionListTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Discussion List Test'),
        ),
        body: BlocBuilder<DiscussionBloc, DiscussionState>(
          builder: (context, state) {
            if (state is DiscussionInitialState) {
              context
                  .read<DiscussionBloc>()
                  .add(DiscussionFetchEvent('GxZSDQBthDDAAeWSEE6T'));
              return Container();
            } else if (state is DiscussionFetchedState) {
              return Column(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Yeni Bir Sohbet Oluştur')),
                  const Divider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: ListView.builder(
                      itemCount: state.discussionList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: paddingOnlyBottomMedium,
                          child: Card(
                            child: ListTile(
                                title: Text(state.discussionList[index].title),
                                subtitle:
                                    Text(state.discussionList[index].startTime),
                                leading: const Icon(Icons.message),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                          FontAwesomeIcons.arrowRight),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChatBotBlocTest(
                                                        uid:
                                                            'GxZSDQBthDDAAeWSEE6T',
                                                        discussionId: state
                                                            .discussionList[
                                                                index]
                                                            .id)));
                                      },
                                    ),
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is DiscussionFetchLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is DiscussionFetchErrorState) {
              return Text(state.errorMessage);
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}
