import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/logic/blocs/discussion/discussion_bloc.dart';
import 'package:flutter_application_1/logic/blocs/discussion/discussion_event.dart';
import 'package:flutter_application_1/logic/blocs/discussion/discussion_state.dart';
import 'package:flutter_application_1/pages/chat_bot_message_page.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_circular_progress.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sohbet Listesi'),
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
                            child: ListTile(
                                title: Text(state.discussionList[index].title),
                                subtitle: Text(state
                                    .discussionList[index].startTime
                                    .toString()),
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
                                                    ChatBotMessagePage(
                                                        uid: widget.uid,
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
            return const Text("Hata");
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
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ChatBotMessagePage(uid: widget.uid))).then((value) {
            if (value == true) {
              context.read<DiscussionBloc>().add(DiscussionResetEvent());
            }
          });
        },
        child: const Text('Yeni Bir Sohbet Oluştur'));
  }
}
