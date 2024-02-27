import '../../../models/discussion_model.dart';

abstract class DiscussionState {}

// Discussion initial state
class DiscussionInitialState extends DiscussionState {}

// Discussion timestamp list fetched state
class DiscussionFetchedState extends DiscussionState {
  final List<DiscussionModel> discussionList;

  DiscussionFetchedState({required this.discussionList});
}

// Discussion fetch loading state
class DiscussionFetchLoadingState extends DiscussionState {}

// Discussion fetch error state
class DiscussionFetchErrorState extends DiscussionState {
  final String errorMessage;

  DiscussionFetchErrorState({required this.errorMessage});
}
