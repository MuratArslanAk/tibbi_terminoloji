import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tibbi_terminoloji/controller/read_controller.dart';
import 'package:tibbi_terminoloji/model/read_model.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final List<Words> data;
  // ignore: prefer_typing_uninitialized_variables
  var searchedItem;
  ReadController textController = Get.find();
  SearchBar(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextField(
        cursorColor: const Color(0xFFCD0916),
        style: const TextStyle(
          backgroundColor: Colors.white,
          color: Colors.black,
        ),
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          searchedItem = searchText;
          textController.searchItem.value = data.where((u) {
            var terim = u.terim.toLowerCase();
            var turkishMeaning = u.turkishMeaning.toLowerCase();
            // var english = u.english.toLowerCase();
            return terim.contains(searchText) ||
                turkishMeaning.contains(searchText); //||
            //english.contains(searchText);
          }).toList();
          if (searchText == "") {
            textController.searchItem.clear();
            textController.textSearched.value = "";
          }
        },
        decoration: InputDecoration(
          iconColor: Colors.white,
          fillColor: Colors.white,
          focusColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFFCD0916),
          ),
          hintText: 'Search..',
        ),
      ),
    );
  }
}
