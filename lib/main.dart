
import 'package:chatgpt_app/bloc/cubit.dart';
import 'package:chatgpt_app/bloc/states.dart';
import 'package:chatgpt_app/home.dart';
import 'package:chatgpt_app/shared/network/remote/dio.dart';
import 'package:chatgpt_app/shared/network/remote/observer/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Dio_Helper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, StateApp>(
          builder: ((context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  bodyText2: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                scaffoldBackgroundColor: Colors.grey[900],
                appBarTheme: AppBarTheme(
                  color: Colors.grey[900],
                  elevation: 0,
                ),
                primarySwatch: Colors.blue,
                bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: Colors.grey[850],
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const ChatGpt_Home(),
            );
          }),
          listener: ((context, state) {})),
    );
  }
}
