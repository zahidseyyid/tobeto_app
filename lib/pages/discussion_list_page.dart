import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constant_padding.dart';
import 'package:tobeto_app/constants/page_constants.dart';
import 'package:tobeto_app/logic/blocs/discussion/discussion_bloc.dart';
import 'package:tobeto_app/logic/blocs/discussion/discussion_event.dart';
import 'package:tobeto_app/logic/blocs/discussion/discussion_state.dart';
import 'package:tobeto_app/widgets/custom_widget/custom_circular_progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscussionListPage extends StatefulWidget {
  final String uid;
  const DiscussionListPage({super.key, required this.uid});

  @override
  State<DiscussionListPage> createState() => _DiscussionListPageState();
}

class _DiscussionListPageState extends State<DiscussionListPage> {
  @override
  void didUpdateWidget(DiscussionListPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Eğer geri dönüş değeri true ise, DiscussionBloc'a DiscussionResetEvent gönder
    if (ModalRoute.of(context)?.settings.arguments == true) {
      context.read<DiscussionBloc>().add(DiscussionResetEvent());
    }
  }

  @override
  void initState() {
    context.read<DiscussionBloc>().add(DiscussionResetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(ChatBotConstants.discussionList),
        ),
        body: BlocBuilder<DiscussionBloc, DiscussionState>(
          builder: (context, state) {
            if (state is DiscussionInitialState) {
              context
                  .read<DiscussionBloc>()
                  .add(DiscussionFetchEvent(widget.uid));
              return Container();
            } else if (state is DiscussionFetchedState) {
              return Column(
                children: [
                  NewDiscussionButton(widget: widget),
                  const Divider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: ListView.builder(
                      itemCount: state.discussionList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: paddingOnlyBottomMedium,
                          child: Card(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/chat_bot', arguments: {
                                  'uid': widget.uid,
                                  'discussionId': state.discussionList[index].id
                                });
                              },
                              child: ListTile(
                                  title:
                                      Text(state.discussionList[index].title),
                                  subtitle: Text(state
                                      .discussionList[index].startTime
                                      .toString()),
                                  leading: Icon(
                                    FontAwesomeIcons.message,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          ChatBotConstants.deleteIcon,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                        onPressed: () {
                                          context.read<DiscussionBloc>().add(
                                              DiscussionDeleteEvent(
                                                  uid: widget.uid,
                                                  discussionId: state
                                                      .discussionList[index]
                                                      .id));
                                        },
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is DiscussionFetchLoadingState) {
              return const Center(child: CustomCircularProgress());
            } else if (state is DiscussionFetchErrorState) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  NewDiscussionButton(widget: widget),
                ],
              ));
            }
            return const Text(DrawerConstants.error);
          },
        ));
  }
}

class NewDiscussionButton extends StatelessWidget {
  const NewDiscussionButton({
    super.key,
    required this.widget,
  });

  final DiscussionListPage widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/chat_bot', arguments: {
            'uid': widget.uid,
          }).then((value) {
            if (value == true) {
              context.read<DiscussionBloc>().add(DiscussionResetEvent());
            }
          });
        },
        child: Text(
          ChatBotConstants.createNewDiscussion,
          style: TextStyle(
            color: Theme.of(context).colorScheme.background,
          ),
        ));
  }
}
