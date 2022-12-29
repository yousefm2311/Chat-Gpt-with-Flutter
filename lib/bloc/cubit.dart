import 'package:chatgpt_app/bloc/states.dart';
import 'package:chatgpt_app/models/model.dart';
import 'package:chatgpt_app/shared/network/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/network/remote/endPoint.dart';

class AppCubit extends Cubit<StateApp> {
  AppCubit() : super(InitializeState());
  static AppCubit get(context) => BlocProvider.of(context);

  PostModel? postModel;
  ModelList? list;
  void postData(String text) {
    emit(PostLoadingState());
    Dio_Helper.postData(
      url: URLTEXT,
      data: {
        "model": "text-davinci-003",
        "prompt": text,
        "temperature": 0,
        "max_tokens": 2000,
      },
    ).then((value) {
      postModel = PostModel.fromJson(value.data);
      emit(PostSuccessState(postModel!));
    }).catchError((error) {
      emit(PostErrorState(error.toString()));
    });
  }

}
