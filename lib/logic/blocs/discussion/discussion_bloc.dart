import 'package:tobeto_app/logic/blocs/discussion/discussion_event.dart';
import 'package:tobeto_app/logic/blocs/discussion/discussion_state.dart';
import 'package:tobeto_app/logic/repositories/chat_bot_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscussionBloc extends Bloc<DiscussionEvent, DiscussionState> {
  final ChatRepository _chatRepository;
  DiscussionBloc(this._chatRepository) : super(DiscussionInitialState()) {
    on<DiscussionFetchEvent>(_onDiscussionFetchEvent);
    on<DiscussionResetEvent>(_discussionReset);
    on<DiscussionDeleteEvent>(_discussionDelete);
  }

  void _onDiscussionFetchEvent(
      DiscussionFetchEvent event, Emitter<DiscussionState> emit) async {
    emit(DiscussionFetchLoadingState());
    final discussionList = await _chatRepository.getDiscussionModels(event.uid);
    if (discussionList.isNotEmpty) {
      emit(DiscussionFetchedState(discussionList: discussionList));
    } else {
      emit(DiscussionFetchErrorState(
          errorMessage: 'Konuşma geçmişi bulunamadı'));
    }
  }

  void _discussionReset(
      DiscussionResetEvent event, Emitter<DiscussionState> emit) {
    emit(DiscussionInitialState());
  }

  void _discussionDelete(
      DiscussionDeleteEvent event, Emitter<DiscussionState> emit) async {
    emit(DiscussionFetchLoadingState());
    await _chatRepository.deleteDiscussion(event.uid, event.discussionId);
    emit(DiscussionInitialState());
  }
}
