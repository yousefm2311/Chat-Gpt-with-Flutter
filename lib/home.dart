// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:chatgpt_app/bloc/cubit.dart';
import 'package:chatgpt_app/bloc/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/component/component.dart';

class buildCard {
  final text;

  buildCard(this.text);
}

class ChatGpt_Home extends StatefulWidget {
  const ChatGpt_Home({super.key});

  @override
  State<ChatGpt_Home> createState() => _ChatGpt_HomeState();
}

class _ChatGpt_HomeState extends State<ChatGpt_Home> {
  int counter = 0;
  List<buildCard> textList = [
    buildCard("Explain quantum computer in simple terms?"),
    buildCard("Got any creative ideas for a 10 year old's birthday?"),
    buildCard("How do i make an HTTP request in Javascript?"),
  ];
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, StateApp>(builder: ((context, state) {
      AppCubit cubit = AppCubit.get(context);
      return Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.menu,
            ),
            elevation: .8,
            centerTitle: true,
            title: const Text("Chat GPT"),
            actions: const [
              Icon(
                Icons.add,
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.sunny,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text("Example", style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 4,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildCardText(textList[index], context);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 15.0,
                        ),
                    itemCount: textList.length),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConditionalBuilder(
                          condition: state is! PostLoadingState,
                          builder: (context) => Text(
                              '${cubit.postModel != null ? cubit.postModel!.choices!.map((e) => e.text) : ""}'),
                          fallback: ((context) => const Padding(
                                padding: EdgeInsets.only(top: 200),
                                child: Text(
                                  "Please Wait Friend 🙂🥹",
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox())
            ],
          ),
          bottomSheet: buildBottomSheet(
            state is! PostLoadingState,
            searchController: searchController,
            onsubmit: (p0) {
              AppCubit.get(context).postData(searchController.text);
            },
            onpressed: () {
              AppCubit.get(context).postData(searchController.text);
            },
          ));
    }), listener: ((context, state) {
      if (state is PostSuccessState) {}
    }));
  }
}
