import 'package:chatgpt_app/home.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildBottomSheet(bool isLoading,{var searchController,required Function() onpressed,Function(String)? onsubmit}) => SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onSubmitted: onsubmit,
                  controller: searchController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade800,
                    filled: true,
                    hintText: "Talk to me 😊",
                    hintStyle: const TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              ConditionalBuilder(
                  condition: isLoading,
                  builder: (context) => IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onpressed,
                        icon: const Icon(Icons.send_rounded),
                      ),
                  fallback: (context) => const CircularProgressIndicator())
            ],
          ),
        ),
      );

Widget buildCardText(
    buildCard model,
    context
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(7.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      );