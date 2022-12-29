// ignore_for_file: prefer_typing_uninitialized_variables

abstract class StateApp {}

class InitializeState extends StateApp {}

class PostSuccessState extends StateApp {
  final postModel;

  PostSuccessState(this.postModel);

}

class PostErrorState extends StateApp {
  final error;

  PostErrorState(this.error);
}

class PostLoadingState extends StateApp {}
class GetLoadingState extends StateApp {}
class GetErrorState extends StateApp {}
class GetSuccessState extends StateApp {}
