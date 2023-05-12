import 'package:get/get.dart';
import 'package:tibbi_terminoloji/model/read_model.dart';

class Dictionary {
  late int id;
  late RxBool isFavorite = false.obs;
  late Words word;

  Dictionary({required this.id, required this.word});
}
